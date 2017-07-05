#!/bin/bash -x

# import.sh: import data from mysql and insert it into ES

#!/bin/sh
JDBC_IMPORTER_HOME="/usr/local/elasticsearch-jdbc-2.3.4.1"
bin=$JDBC_IMPORTER_HOME/bin
lib=$JDBC_IMPORTER_HOME/lib
host=localhost

echo '{
"type" : "jdbc",
"jdbc": {
"elasticsearch.autodiscover":true,
"url":"jdbc:mysql://localhost:3306/es_t",
"user":"root",
"password":"Mysql1995*",
"sql":"select * ,id as _id from news",
"elasticsearch" : {
  "cluster" : "hw_es_cluster",
  "host" : "localhost",
  "port" : 9300
},
"index" : "es_t",
"type" : "news"
}
}'| java \
  -cp "${lib}/*" \
  -Dlog4j.configurationFile=${bin}/log4j2.xml \
  org.xbib.tools.Runner \
  org.xbib.tools.JDBCImporter
