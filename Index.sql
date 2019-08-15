
CREATE INDEX sf_indx_tblusers(id, user_key, user_email, user_password, user_role_id, active_status, delete_status);

CREATE INDEX sf_indx_tbluserlogins(user_id, user_token, last_accessed_at);

CREATE INDEX sf_indx_tblposts(post_key, category_id, active_status, delete_status);

CREATE INDEX sf_indx_tblpostattachments(post_id, active_status, delete_status);