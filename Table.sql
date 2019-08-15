CREATE TABLE sf_tbl_user_roles (
  id SERIAL PRIMARY KEY,
  user_role_key VARCHAR(12) NOT NULL UNIQUE DEFAULT sf_udf_generate_tbl_keys('user'),
  user_role_name VARCHAR(50) NOT NULL,
  active_status BOOLEAN NOT NULL DEFAULT true,
  delete_status BOOLEAN NOT NULL DEFAULT false,
  created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
  deleted_at TIMESTAMP WITH TIME ZONE
);

INSERT INTO sf_tbl_user_roles (user_role_name) VALUES
('Super Admin'),
('Faculties'),
('Students');

CREATE TABLE sf_tbl_departments (
  id SERIAL PRIMARY KEY,
  department_key VARCHAR(12) NOT NULL UNIQUE DEFAULT sf_udf_generate_tbl_keys('dept'),
  department_name VARCHAR(50) NOT NULL,
  active_status BOOLEAN NOT NULL DEFAULT true,
  delete_status BOOLEAN NOT NULL DEFAULT false,
  created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
  deleted_at TIMESTAMP WITH TIME ZONE
);

INSERT INTO sf_tbl_departments (department_name) VALUES
('BCA.'),
('BSC.'),
('B. Tech.'),
('MCA.'),
('BBA.'),
('MBA.');

INSERT INTO sf_tbl_users VALUES(DEFAULT,'',3,'Alan','Walker','alan@walker','BCA','987456321','nopass');

CREATE TABLE sf_tbl_users (
  id SERIAL PRIMARY KEY,
  user_key VARCHAR(12) NOT NULL UNIQUE DEFAULT sf_udf_generate_tbl_keys('user'),
  user_role_id INT NOT NULL DEFAULT 3,
  user_first_name VARCHAR(100) NOT NULL,
  user_last_name VARCHAR(100) NOT NULL,
  user_email VARCHAR(100) NOT NULL UNIQUE, 
  user_student_id VARCHAR(255) NOT NULL,
  user_mobile_number VARCHAR(10) NOT NULL,
  user_password VARCHAR(255) NOT NULL,
  user_address_street VARCHAR(100) ,
  user_address_city VARCHAR(100) ,
  user_address_state VARCHAR(100) ,
  user_address_country VARCHAR(100) ,
  user_address_zip VARCHAR(100) ,
  user_profile_pic VARCHAR(20) NOT NULL DEFAULT 'no-image.jpeg',
  active_status BOOLEAN NOT NULL DEFAULT true,
  delete_status BOOLEAN NOT NULL DEFAULT false,
  created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
  deleted_at TIMESTAMP WITH TIME ZONE
);

CREATE TABLE sf_tbl_user_logins (
  id SERIAL PRIMARY KEY,
  user_id INT NOT NULL,
  user_token VARCHAR(64) NOT NULL UNIQUE DEFAULT sf_udf_generate_random_string(64),
  last_logged_in_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
  last_accessed_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW()
);

CREATE TABLE sf_tbl_categories (
  id SERIAL PRIMARY KEY,
  category_key VARCHAR(12) NOT NULL UNIQUE DEFAULT sf_udf_generate_tbl_keys('catg'),
  category_name VARCHAR(100) NOT NULL,
  active_status BOOLEAN NOT NULL DEFAULT true,
  delete_status BOOLEAN NOT NULL DEFAULT false,
  created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
  deleted_at TIMESTAMP WITH TIME ZONE
);

CREATE TABLE sf_tbl_posts (
  id SERIAL PRIMARY KEY,
  post_key VARCHAR(12) NOT NULL UNIQUE DEFAULT sf_udf_generate_tbl_keys('post'),
  category_id INT NOT NULL,
  user_id INT NOT NULL,
  post_title VARCHAR(255) NOT NULL,
  post_description TEXT NOT NULL,
  post_short_description VARCHAR(255) NOT NULL,
  active_status BOOLEAN NOT NULL DEFAULT true,
  delete_status BOOLEAN NOT NULL DEFAULT false,
  created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
  deleted_at TIMESTAMP WITH TIME ZONE
);
