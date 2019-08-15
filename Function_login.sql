CREATE OR REPLACE FUNCTION sf_udf_users_superadmin_login(
	useremail VARCHAR(255),
	userpass VARCHAR(255)
) RETURNS JSON AS
$BODY$
DECLARE userid INT;
DECLARE usertoken VARCHAR(64);
BEGIN
	SELECT
	id INTO userid
	FROM sf_tbl_users
	WHERE user_email = useremail
	AND user_password = MD5(userpass)
	AND user_role_id = 1
	AND active_status = TRUE
	AND delete_status = FALSE;

	IF userid IS NOT NULL THEN
		INSERT INTO sf_tbl_user_logins (user_id)
		VALUES (userid)
		RETURNING user_token INTO usertoken;

		RETURN (
			SELECT JSON_BUILD_OBJECT(
				'data', (
					SELECT JSON_BUILD_OBJECT(
						'id', (SELECT user_key FROM sf_tbl_users WHERE id = userid),
						'access_token', usertoken
					)
				),
				'status', 200
			)
		);
	ELSE
		RETURN (
			SELECT JSON_BUILD_OBJECT(
				'status', 204
			)
		);
	END IF;
END;
$BODY$
LANGUAGE plpgsql;



CREATE OR REPLACE FUNCTION sf_udf_users_faculties_login(
	useremail VARCHAR(255),
	userpass VARCHAR(255)
) RETURNS JSON AS
$BODY$
DECLARE userid INT;
DECLARE usertoken VARCHAR(64);
BEGIN
	SELECT
	id INTO userid
	FROM sf_tbl_users
	WHERE user_email = useremail
	AND user_password = MD5(userpass)
	AND user_role_id = 2
	AND active_status = TRUE
	AND delete_status = FALSE;

	IF userid IS NOT NULL THEN
		INSERT INTO sf_tbl_user_logins (user_id)
		VALUES (userid)
		RETURNING user_token INTO usertoken;

		RETURN (
			SELECT JSON_BUILD_OBJECT(
				'data', (
					SELECT JSON_BUILD_OBJECT(
						'id', (SELECT user_key FROM sf_tbl_users WHERE id = userid),
						'access_token', usertoken
					)
				),
				'status', 200
			)
		);
	ELSE
		RETURN (
			SELECT JSON_BUILD_OBJECT(
				'status', 204
			)
		);
	END IF;
END;
$BODY$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION sf_udf_users_student_login(
	useremail VARCHAR(255),
	userpass VARCHAR(255)
) RETURNS JSON AS
$BODY$
DECLARE userid INT;
DECLARE usertoken VARCHAR(64);
BEGIN
	SELECT
	id INTO userid
	FROM sf_tbl_users
	WHERE user_email = useremail
	AND user_password = MD5(userpass)
	AND user_role_id = 3
	AND active_status = TRUE
	AND delete_status = FALSE;

	IF userid IS NOT NULL THEN
		INSERT INTO sf_tbl_user_logins (user_id)
		VALUES (userid)
		RETURNING user_token INTO usertoken;

		RETURN (
			SELECT JSON_BUILD_OBJECT(
				'data', (
					SELECT JSON_BUILD_OBJECT(
						'id', (SELECT user_key FROM sf_tbl_users WHERE id = userid),
						'access_token', usertoken
					)
				),
				'status', 200
			)
		);
	ELSE
		RETURN (
			SELECT JSON_BUILD_OBJECT(
				'status', 204
			)
		);
	END IF;
END;
$BODY$
LANGUAGE plpgsql;