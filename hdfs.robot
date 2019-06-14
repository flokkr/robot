

*** Settings ***
Documentation    Test suite to check HDFS functionality
Library          OperatingSystem
Library          String
Resource         common.robot

*** Test Cases ***

Test HDFS Cli
  ${random} =    Generate Random String  5  [NUMBERS]
  Execute        hdfs dfs -ls /
  Execute        hdfs dfs -mkdir -p /test/${random}
  Execute        hdfs dfs -put /opt/hadoop/LICENSE.txt /test/${random}/file1
  Execute        hdfs dfs -get /test/${random}/file1 /tmp/file${random}
  Same files     /tmp/file${random}    /opt/hadoop/LICENSE.txt
  Execute        rm /tmp/file${random}

