

*** Settings ***
Documentation    Test suite to check HDFS functionality
Library          OperatingSystem
Library          String
Resource         common.robot

*** Test Cases ***

Create Zookeeper key
  ${random} =   Generate Random String  5  [NUMBERS]
                Execute        /opt/zookeeper/bin/zkCli.sh create /${random}/one data1
  ${output}     Execute        /opt/zookeeper/bin/zkCli.sh get /${random}/one
  Should contain  ${output}    data1
