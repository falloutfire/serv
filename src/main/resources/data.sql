drop table if exists user_role;
drop table if exists app_role;
drop table if exists app_user;

CREATE TABLE app_role (
                        id bigint NOT NULL ,
                        description varchar(255) DEFAULT NULL,
                        role_name varchar(255) DEFAULT NULL,
                        PRIMARY KEY (id)
);


CREATE TABLE app_user (
                        id bigint NOT NULL ,
                        first_name varchar(255) NOT NULL,
                        last_name varchar(255) NOT NULL,
                        email varchar(255) NOT NULL,
                        password varchar(255) NOT NULL,
                        username varchar(255) NOT NULL,
                        PRIMARY KEY (id)
);


CREATE TABLE user_role (
                         user_id bigint NOT NULL,
                         role_id bigint NOT NULL,
                         CONSTRAINT FK859n2jvi8ivhui0rl0esws6o FOREIGN KEY (user_id) REFERENCES app_user (id),
                         CONSTRAINT FKa68196081fvovjhkek5m97n3y FOREIGN KEY (role_id) REFERENCES app_role (id)
);

INSERT INTO app_role (id, role_name, description)
VALUES (1, 'ROLE_USER', 'Standard User - Has no admin rights');
INSERT INTO app_role (id, role_name, description)
VALUES (2, 'ROLE_ADMIN', 'Admin User - Has permission to perform admin tasks');

-- USER
-- non-encrypted password: jwtpass
INSERT INTO app_user (id, first_name, last_name, password, username, email)
VALUES (1, 'Ilya', 'Man', '$2a$04$Cba8DVPiJDqJMTYVsGQmpuEnW4nVcfNke/d9XG0EOKPXyHZfbqXTC', 'user', 'test@gmail.com');
INSERT INTO app_user (id, first_name, last_name, password, username, email)
VALUES (2, 'Admin', 'Admin', '$2a$04$EZzbSqieYfe/nFWfBWt2KeCdyq0UuDEM1ycFF8HzmlVR6sbsOnw7u', 'admin', 'test@gmail.com');


INSERT INTO user_role(user_id, role_id) VALUES(1,1);
INSERT INTO user_role(user_id, role_id) VALUES(2,1);
INSERT INTO user_role(user_id, role_id) VALUES(2,2);

drop table if exists oauth_client_details;
create table oauth_client_details (
                                    client_id VARCHAR(256) PRIMARY KEY,
                                    resource_ids VARCHAR(256),
                                    client_secret VARCHAR(256),
                                    scope VARCHAR(256),
                                    authorized_grant_types VARCHAR(256),
                                    web_server_redirect_uri VARCHAR(256),
                                    authorities VARCHAR(256),
                                    access_token_validity INTEGER,
                                    refresh_token_validity INTEGER,
                                    additional_information VARCHAR(4096),
                                    autoapprove VARCHAR(256)
);

drop table if exists oauth_client_details;
create table oauth_client_details (
                                    client_id VARCHAR(256) PRIMARY KEY,
                                    resource_ids VARCHAR(256),
                                    client_secret VARCHAR(256),
                                    scope VARCHAR(256),
                                    authorized_grant_types VARCHAR(256),
                                    web_server_redirect_uri VARCHAR(256),
                                    authorities VARCHAR(256),
                                    access_token_validity INTEGER,
                                    refresh_token_validity INTEGER,
                                    additional_information VARCHAR(4096),
                                    autoapprove VARCHAR(256)
);
drop table if exists oauth_access_token;
create table oauth_access_token (
                                  token_id VARCHAR(255),
                                  token bytea,
                                  authentication_id VARCHAR(255),
                                  user_name VARCHAR(255),
                                  client_id VARCHAR(255),
                                  authentication bytea,
                                  refresh_token VARCHAR(255)
);

create index oauth_access_token_id on oauth_access_token(token_id);
create index oauth_refresh_token_id on oauth_access_token(token_id);

drop table if exists oauth_refresh_token;
create table oauth_refresh_token (
                                   token_id VARCHAR(255),
                                   token bytea,
                                   authentication bytea
);
drop table if exists oauth_code;
create table oauth_code (
                          code VARCHAR(255), authentication bytea
);

drop table if exists oauth_approvals;
create table oauth_approvals (
                               userId VARCHAR(255),
                               clientId VARCHAR(255),
                               scope VARCHAR(255),
                               status VARCHAR(10),
                               expiresAt TIMESTAMP,
                               lastModifiedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
drop table if exists ClientDetails;
create table ClientDetails (
                             appId VARCHAR(255) PRIMARY KEY,
                             resourceIds VARCHAR(255),
                             appSecret VARCHAR(255),
                             scope VARCHAR(255),
                             grantTypes VARCHAR(255),
                             redirectUrl VARCHAR(255),
                             authorities VARCHAR(255),
                             access_token_validity INTEGER,
                             refresh_token_validity INTEGER,
                             additionalInformation VARCHAR(4096),
                             autoApproveScopes VARCHAR(255)
);


-- insert client details
INSERT INTO oauth_client_details
(client_id, client_secret, scope, authorized_grant_types,
 authorities, access_token_validity, refresh_token_validity)
VALUES
('mobile_app_client', '$2a$04$2R.wNqw3EYqh0tqobaknAO00ZNUDPqMn7Y0kWSjXqtQm8EW012wk.', 'read,write', 'password,refresh_token,client_credentials,authorization_code', 'ROLE_CLIENT,ROLE_TRUSTED_CLIENT', 900, 2000);
