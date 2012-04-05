# This file contains the table definitions necessary for using the OAuth provider class out of the box.

CREATE TABLE `oauth_provider_consumer` (
`consumer_id` int(11) NOT NULL AUTO_INCREMENT,
`consumer_key` varchar(40) NOT NULL,
`consumer_secret` varchar(40) NOT NULL,
`consumer_create_date` int(11) NOT NULL,
PRIMARY KEY (`consumer_id`)
);
/* MS Sql
CREATE TABLE api.dbo.oauth_provider_consumer (
  consumer_id int NOT NULL identity(1,1) ,
  consumer_key varchar(40) NOT NULL,
  consumer_secret varchar(40) NOT NULL,
  consumer_create_date int NOT NULL,
  user_id int Not Null,
  createddate datetime not null default getdate(),
  PRIMARY KEY (consumer_id)
)


create table api.dbo.api_access (
  id int NOT NULL identity(1,1) ,
  consumer_id int NOT NULL ,
  consumer_key varchar(40) not null ,
  api_object varchar(40) not null ,
  access_allowed bool not null ,
  createddate datetime not null default getdate(),
  PRIMARY KEY (id)
)


*/


# Could be emptied by a cronjonb every five minutes for each row where nonce_data < now() - 5 minutes
CREATE TABLE `oauth_provider_nonce` (
`nonce` varchar(255) NOT NULL,
`nonce_consumer_key` varchar(40) NOT NULL,
`nonce_date` int(11) NOT NULL,
PRIMARY KEY (`nonce`)
);

# Could be emptied every hour for each row where request_token_date < now() - 60 minutes
CREATE TABLE `oauth_provider_request_token` (
`request_token_id` int(11) NOT NULL AUTO_INCREMENT,
`request_token` varchar(40) NOT NULL,
`request_token_secret` varchar(40) NOT NULL,
`request_token_verification_code` varchar(40),
`request_token_user_id` int(11),
`request_token_date` int(11) NOT NULL,
`request_token_consumer_key` varchar(40) NOT NULL,
`request_token_callback` text NOT NULL,
`request_token_scope` text NOT NULL,
PRIMARY KEY (`request_token_id`),
UNIQUE KEY (`request_token`)
);

CREATE TABLE `oauth_provider_access_token` (
`access_token_id` int(11) NOT NULL AUTO_INCREMENT,
`access_token` varchar(40) NOT NULL,
`access_token_secret` varchar(40) NOT NULL,
`access_token_user_id` int(11),
`access_token_date` int(11) NOT NULL,
`access_token_consumer_key` varchar(40) NOT NULL,
`access_token_scope` text NOT NULL,
PRIMARY KEY (`access_token_id`),
UNIQUE KEY (`access_token`)
);

###########################################################################################
#### tables below are just for the example, ignore them if you don't want to try it out ###
###########################################################################################

CREATE TABLE `user` (
`user_id` int(11) NOT NULL AUTO_INCREMENT,
`user_name` varchar(20) NOT NULL,
`user_password` varchar(20) NOT NULL,
PRIMARY KEY (`user_id`)
);

CREATE TABLE `user_messages` (
`message_id` int(11) NOT NULL AUTO_INCREMENT,
`user_id` int(11),
`message_text` text NOT NULL,
PRIMARY KEY (`message_id`)
);

CREATE TABLE `user_images` (
`image_id` int(11) NOT NULL AUTO_INCREMENT,
`user_id` int(11),
`image_url` text NOT NULL,
PRIMARY KEY (`image_id`)
);
