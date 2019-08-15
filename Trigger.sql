CREATE OR REPLACE FUNCTION sf_udf_user_on_insert()
RETURNS TRIGGER AS
$BODY$
BEGIN
  IF NEW.user_role_id = 1 THEN
    NEW.user_key := sf_udf_generate_tbl_keys('sadm');
  ELSE
    NEW.user_key := sf_udf_generate_tbl_keys('user');
  END IF;

  RETURN NEW;
END;
$BODY$
LANGUAGE plpgsql;

CREATE TRIGGER sf_trigger_user_before_insert
BEFORE INSERT ON sf_tbl_users
FOR EACH ROW
EXECUTE PROCEDURE sf_udf_user_on_insert();