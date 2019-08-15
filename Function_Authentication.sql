CREATE OR REPLACE FUNCTION sf_udf_admin_auth_check(
	userkey VARCHAR(12),
	usertoken VARCHAR(64)
) RETURNS JSON AS
$BODY$
DECLARE userid INT;
BEGIN
	SELECT
	u.id INTO userid
	FROM sf_tbl_users AS u
	JOIN sf_tbl_user_logins AS l
	ON u.id = l.user_id
	WHERE u.user_key = userkey
	AND l.user_token = usertoken
	AND u.user_role_id = 1
	AND u.active_status = TRUE
	AND u.delete_status = FALSE
	AND (EXTRACT(EPOCH FROM (NOW()::TIMESTAMP - l.last_accessed_at::TIMESTAMP))) < 3600;

	IF userid IS NOT NULL THEN
		UPDATE dpd_tbl_user_logins SET
		last_accessed_at = NOW()
		WHERE user_id = userid
		AND user_token = usertoken;

		RETURN (
			SELECT JSON_BUILD_OBJECT(
				'status', 200
			)
		);
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




CREATE OR REPLACE FUNCTION sf_udf_faculty_auth_check(
	userkey VARCHAR(12),
	usertoken VARCHAR(64)
) RETURNS JSON AS
$BODY$
DECLARE userid INT;
BEGIN
	SELECT
	u.id INTO userid
	FROM sf_tbl_users AS u
	JOIN sf_tbl_user_logins AS l
	ON u.id = l.user_id
	WHERE u.user_key = userkey
	AND l.user_token = usertoken
	AND u.user_role_id = 2
	AND u.active_status = TRUE
	AND u.delete_status = FALSE
	AND (EXTRACT(EPOCH FROM (NOW()::TIMESTAMP - l.last_accessed_at::TIMESTAMP))) < 3600;

	IF userid IS NOT NULL THEN
		UPDATE dpd_tbl_user_logins SET
		last_accessed_at = NOW()
		WHERE user_id = userid
		AND user_token = usertoken;

		RETURN (
			SELECT JSON_BUILD_OBJECT(
				'status', 200
			)
		);
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




CREATE OR REPLACE FUNCTION sf_udf_student_auth_check(
	userkey VARCHAR(12),
	usertoken VARCHAR(64)
) RETURNS JSON AS
$BODY$
DECLARE userid INT;
BEGIN
	SELECT
	u.id INTO userid
	FROM sf_tbl_users AS u
	JOIN sf_tbl_user_logins AS l
	ON u.id = l.user_id
	WHERE u.user_key = userkey
	AND l.user_token = usertoken
	AND u.user_role_id = 3
	AND u.active_status = TRUE
	AND u.delete_status = FALSE
	AND (EXTRACT(EPOCH FROM (NOW()::TIMESTAMP - l.last_accessed_at::TIMESTAMP))) < 3600;

	IF userid IS NOT NULL THEN
		UPDATE dpd_tbl_user_logins SET
		last_accessed_at = NOW()
		WHERE user_id = userid
		AND user_token = usertoken;

		RETURN (
			SELECT JSON_BUILD_OBJECT(
				'status', 200
			)
		);
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