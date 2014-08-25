create table tbl_report_input_form(
	id bigint auto_increment,
	government_sector_organization_id int(11) NOT NULL,
	primary key(id),
	foreign key(government_sector_organization_id) references tbl_government_sector_organization(id)
);

create table tbl_basic_info_about_report(
	report_input_form_id bigint not null,
	plan_for_freedom_of_information text NOT NULL,
	primary key(report_input_form_id),
	foreign key(report_input_form_id) references tbl_report_input_form(id)
);

create table tbl_request_to_obtain_information(
	report_input_form_id bigint not null,
	number_of_request_for_information_male int(11) NOT NULL,
  	number_of_request_for_information_female int(11) NOT NULL,
  	number_of_information_request_fully_accepted int(11) NOT NULL,
  	number_of_information_request_partially_accepted int(11) NOT NULL,
  	number_of_information_request_fully_rejected int(11) NOT NULL,
  	number_of_information_request_transferred_from_last_year int(11) NOT NULL,
  	number_of_appeals_to_organization_official int(11) NOT NULL,
  	number_of_appeals_to_main_ombudsman_office int(11) NOT NULL,
  	appeal_result_main_ombudsman_office text NOT NULL,
  	number_of_appeals_to_court int(11) NOT NULL,
  	appeal_result_to_court text NOT NULL,
	primary key(report_input_form_id),
	foreign key(report_input_form_id) references tbl_report_input_form(id)
);

create table tbl_classified_information_category(
	report_input_form_id bigint not null,
	number_of_classified_information_rejection_cause int(11) NOT NULL,
  	classified_information_rejection_cause_category text NOT NULL,
	primary key(report_input_form_id),
	foreign key(report_input_form_id) references tbl_report_input_form(id)
);

create table tbl_appeal_to_gov_body(
	report_input_form_id bigint not null,
	number_of_information_request_to_organization_head int(11) NOT NULL,
  	number_of_appeals_decision_given int(11) NOT NULL,
  	number_of_appeals_fully_accepted int(11) NOT NULL,
  	number_of_appeals_partially_accepted int(11) NOT NULL,
  	number_of_appeals_fully_rejected int(11) NOT NULL,
	primary key(report_input_form_id),
	foreign key(report_input_form_id) references tbl_report_input_form(id)
);

create table tbl_service_performed_by_the_given_time_duration(
	report_input_form_id bigint not null,
	number_of_information_request_between_30_days float NOT NULL,
  	number_of_days_required_to_serve_request_between_30_days float NOT NULL,
  	number_of_information_request_took_more_than_30_days int(11) NOT NULL,
  	number_of_urgent_information_request_between_10_days float NOT NULL,
  	number_of_days_required_to_serve_urgent_request_between_10_days float NOT NULL,
	primary key(report_input_form_id),
	foreign key(report_input_form_id) references tbl_report_input_form(id)
);

create table tbl_information_service_admin_cost(
	report_input_form_id bigint not null,
	cost_of_serving_information_request float NOT NULL,
  	cost_of_publising_information float NOT NULL,
  	revenue_collected_from_users_cover_admin_cost float NOT NULL,
  	number_of_information_request_served_free_of_charge int(11) NOT NULL,
	primary key(report_input_form_id),
	foreign key(report_input_form_id) references tbl_report_input_form(id)
);

create table tbl_other_issues_report_must_contain(
	report_input_form_id bigint not null,
	number_trainings_provided int(11) NOT NULL,
  	techniques_for_urgent_information_request_reply text NOT NULL,
  	experience_ict_utilization text NOT NULL,
	primary key(report_input_form_id),
	foreign key(report_input_form_id) references tbl_report_input_form(id)
);

create table tbl_publishing_information(
	report_input_form_id bigint not null,
	number_of_printed_publications int(11) NOT NULL,
  	type_of_printed_publication varchar(200) NOT NULL,
  	printed_publication_content varchar(200) NOT NULL,
  	printed_publication_amount int(11) NOT NULL,
  	number_of_electronic_publication int(11) NOT NULL,
  	type_of_electronic_publication varchar(200) NOT NULL,
  	electronic_publication_content varchar(200) NOT NULL,
	primary key(report_input_form_id),
	foreign key(report_input_form_id) references tbl_report_input_form(id)
);

create table tbl_problems_and_solutions_implementation(
	report_input_form_id bigint not null,
	problems_and_solutions_observed_during_implementation text NOT NULL,
	primary key(report_input_form_id),
	foreign key(report_input_form_id) references tbl_report_input_form(id)
);

create table tbl_zone(
	id int auto_increment,
	region_id int not null,
	zone_name varchar(100) not null,
	primary key(id),
	foreign key(region_id) references tbl_region(id)
);

create table tbl_woreda(
	id int auto_increment,
	zone_id int not null,
	woreda_name varchar(100) not null,
	primary key(id),
	foreign key(zone_id) references tbl_zone(id)
);

create table tbl_kebele(
	id int auto_increment,
	woreda_id int not null,	
	kebele_name varchar(100) not null,
	primary key(id),
	foreign key(woreda_id) references tbl_woreda(id)
);

create table tbl_signature(
	id int auto_increment,
	user_id int not null,
	signature blob not null,
	primary key(id),
	foreign key(user_id) references tbl_user(id)
);

create table tbl_paper_publication(
	report_input_form_id bigint not null,
	brochure_amount int not null,
	magazine_amount int not null,
	pamphlet_amount int not null,
	news_paper_amount int not null,
	others_amount int not null,
	primary key(report_input_form_id),
	foreign key(report_input_form_id) references tbl_report_input_form(id)
);

create table tbl_electronic_publication(
	report_input_form_id bigint not null,
	cd_amount int not null,
	dvd_amount int not null,
	floppy_disk_amount int not null,
	web_amount int not null,
	social_media_amount int not null,
	primary key(report_input_form_id),
	foreign key(report_input_form_id) references tbl_report_input_form(id)
);

create table tbl_broadcast(
	report_input_form_id bigint not null,
	radio_amount int not null,
	radio_air_usage float not null,
	television_amount int not null,
	television_air_usage float not null,
	others_amount int not null,
	others_air_usage float not null,
	primary key(report_input_form_id),
	foreign key(report_input_form_id) references tbl_report_input_form(id)
);

create table tbl_appeal_to_organization_head(
	report_input_form_id bigint not null,
	number_of_appeal int not null,
	number_of_request_rejected_by_pr int not null,
	number_of_request_approved_by_pr int not null,
	number_of_request_improved_by_pr int not null,
	number_of_decision_in_progress int not null,
	primary key(report_input_form_id),
	foreign key(report_input_form_id) references tbl_report_input_form(id)
);

create table tbl_appeal_to_main_ombudsman(
	report_input_form_id bigint not null,
	number_of_appeal int not null,
	number_of_request_rejected_by_head int not null,
	number_of_request_approved_by_head int not null,
	number_of_request_improved_by_head int not null,
	number_of_decision_in_progress int not null,
	primary key(report_input_form_id),
	foreign key(report_input_form_id) references tbl_report_input_form(id)
);

create table tbl_appeal_to_court(
	report_input_form_id bigint not null,
	gov_body_number_of_decision_rejecting_previous_decision int not null,
	gov_body_number_of_decision_approving_previous_decision int not null,
	gov_body_number_of_decision_improving_previous_decision int not null,
	info_requester_number_of_decision_rejecting_previous_decision int not null,
	info_requester_number_of_decision_approving_previous_decision int not null,
	info_requester_number_of_decision_improving_previous_decision int not null,
	primary key(report_input_form_id),
	foreign key(report_input_form_id) references tbl_report_input_form(id)
);

create table tbl_rejection_certificate(
	report_input_form_id bigint not null,
	number_of_secrete_information_given_rejection_certificate int not null,
	primary key(report_input_form_id),
	foreign key(report_input_form_id) references tbl_report_input_form(id)
);

create table tbl_publication_content(
	report_input_form_id bigint not null,
	_951 tinyint not null,
	_952 tinyint not null,
	_953 tinyint not null,
	_954 tinyint not null,
	_955 tinyint not null,
	_956 tinyint not null,
	_957 tinyint not null,
	_958 tinyint not null,
	_959 tinyint not null,	
	primary key(report_input_form_id),
	foreign key(report_input_form_id) references tbl_report_input_form(id)
);