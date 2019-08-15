CREATE OR REPLACE FUNCTION sf_udf_admin_post_creating(
	userkey VARCHAR(12),
	usertoken VARCHAR(64)
) RETURNS JSON AS
$BODY$
DECLARE authcheck JSON;
DECLARE record_data JSON;
BEGIN
	SELECT * FROM sf_udf_admin_auth_check(userkey, usertoken) INTO authcheck;

	IF (authcheck::JSON->>'status')::INT = 200 THEN
		SELECT JSON_AGG(JSON_BUILD_OBJECT(
			'id', p.post_key,
			'category_name', c.category_name,
			'post_title', p.post_title,
			'post_description', p.post_description,
		)) INTO record_data FROM sf_tbl_posts AS p
		JOIN sf_tbl_categories AS c
		ON p.category_id = c.id
		WHERE p.active_status = TRUE
		AND p.delete_status = FALSE
		AND c.active_status = TRUE
		AND c.delete_status = FALSE;

		IF json_array_length(record_data) = 0 OR record_data IS NULL THEN
			RETURN (
				SELECT JSON_BUILD_OBJECT(
					'status', 204
				)
			);
		ELSE
			RETURN (
				SELECT JSON_BUILD_OBJECT(
					'data', (
						record_data
					),
					'status', 200
				)
			);
		END IF;
	ELSE
		RETURN (
			SELECT JSON_BUILD_OBJECT(
				'status', 401
			)
		);
	END IF;
END;
$BODY$
LANGUAGE plpgsql;