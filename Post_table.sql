
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



INSERT INTO sf_tbl_categories (category_name) VALUES
('General Notice'),
('General Announcement'),
('Examination Info'),
('Academic Resource'),
('Academic Queries'),
('Placemet');


CREATE TABLE sf_tbl_posts (
  id SERIAL PRIMARY KEY,
  post_key VARCHAR(12) NOT NULL UNIQUE DEFAULT sf_udf_generate_tbl_keys('post'),
  category_id INT NOT NULL DEFAULT 1,
  user_id INT NOT NULL,
  post_title VARCHAR(255) NOT NULL,
  post_description TEXT NOT NULL,
  active_status BOOLEAN NOT NULL DEFAULT true,
  delete_status BOOLEAN NOT NULL DEFAULT false,
  created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
  deleted_at TIMESTAMP WITH TIME ZONE
);

