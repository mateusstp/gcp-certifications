10.51.0.2:5432
export ALLOYDB=10.51.0.2
echo $ALLOYDB  > alloydbip.txt 
psql -h $ALLOYDB -U postgres

Change3Me

export SAMPLE_PASSWORD=Change3Me
export SAMPLE_NETWORK=peering-network
export GCP_REGION_VALUE=us-east1
export QWIKLABS_PROJECT_ID=qwiklabs-gcp-04-467e265fa653
export SAMPLE_CLUSTER_ID=lab-cluster
export SAMPLE_INSTANCE_ID=lab-instance
export SAMPLE_READ_POOL_INSTANCE_ID=lab-instance-rp1
export SAMPLE_BACKUP_ID=lab-backup


echo $SAMPLE_PASSWORD
echo $SAMPLE_NETWORK
echo $GCP_REGION_VALUE
echo $QWIKLABS_PROJECT_ID
echo $SAMPLE_CLUSTER_ID
echo $SAMPLE_INSTANCE_ID
echo $SAMPLE_READ_POOL_INSTANCE_ID
echo $SAMPLE_BACKUP_ID

gcloud beta alloydb clusters create $SAMPLE_CLUSTER_ID \
    --password=$SAMPLE_PASSWORD \
    --network=$SAMPLE_NETWORK \
    --region=$GCP_REGION_VALUE \
    --project=$QWIKLABS_PROJECT_ID
	
gcloud beta alloydb instances create $SAMPLE_INSTANCE_ID \
    --instance-type=PRIMARY \
    --cpu-count=2 \
    --region=$GCP_REGION_VALUE  \
    --cluster=$SAMPLE_CLUSTER_ID  \
    --project=$QWIKLABS_PROJECT_ID
	
	
gcloud beta alloydb instances create $SAMPLE_READ_POOL_INSTANCE_ID \
    --instance-type=READ_POOL \
    --cpu-count=2 \
    --read-pool-node-count=2 \
    --region=$GCP_REGION_VALUE  \
    --cluster=$SAMPLE_CLUSTER_ID  \
    --project=$QWIKLABS_PROJECT_ID
	
	
 gcloud beta alloydb backups create $SAMPLE_BACKUP_ID \
    --cluster=$SAMPLE_CLUSTER_ID \
    --region=$GCP_REGION_VALUE \
    --project=$QWIKLABS_PROJECT_ID
	
	
DROP TABLE IF EXISTS regions;
CREATE TABLE regions (
    region_id bigint NOT NULL,
    region_name varchar(25)
) ;
ALTER TABLE regions ADD PRIMARY KEY (region_id);

DROP TABLE IF EXISTS countries;
CREATE TABLE countries (
    country_id char(2) NOT NULL,
    country_name varchar(40),
	region_id bigint
) ;
ALTER TABLE countries ADD PRIMARY KEY (country_id);


DROP TABLE IF EXISTS departments;
CREATE TABLE departments (
	department_id	smallint NOT NULL,
	department_name	varchar(30),
	manager_id	integer,
	location_id	smallint
) ;
ALTER TABLE departments ADD PRIMARY KEY (department_id);



INSERT INTO regions
VALUES 
(1, 'Europe'),
(2, 'Americas'),
(3, 'Asia'),
(4, 'Middle East and Africa');

INSERT INTO countries
VALUES 
('IT', 'Italy', 1 ),
('JP', 'Japan', 3 ),
('US', 'United States of America', 2 ),
('CA', 'Canada', 2 ),
('CN', 'China', 3 ),
('IN', 'India', 3 ),
('AU', 'Australia', 3 ),
('ZW', 'Zimbabwe', 4 ),
('SG', 'Singapore', 3 );

INSERT INTO departments
VALUES 
(10, 'Administration', 200, 1700),
(20, 'Marketing', 201, 1800),
(30, 'Purchasing', 114, 1700),
(40, 'Human Resources', 203, 2400),
(50, 'Shipping', 121, 1500),
(60, 'IT', 103, 1400);