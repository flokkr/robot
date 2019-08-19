

*** Settings ***
Documentation    Test suite to check HDFS functionality
Library          OperatingSystem
Library          String
Resource         common.robot
Library          RequestsLibrary
                  
                  
*** Keywords ***  
Test HDFS port                                       
   Create Session   webport  http://hdfs-namenode-0.hdfs-namenode:9820
   ${resp} =  Get Request  webport  /                   
   Should Be Equal As Strings  ${resp.status_code}  404
   Should Contain  ${resp.text}  It looks like 
                                                                            
*** Test Cases ***                                                          
                                                                            
Test HDFS is Up and running                                                 
   Wait Until Keyword Succeeds  10x  3s  Test HDFS port                      
                 
*** Test Cases ***

Test HDFS Cli
  ${random} =    Generate Random String  5  [NUMBERS]
  Execute        hdfs dfs -ls /
  Execute        hdfs dfs -mkdir -p /test/${random}
  Execute        hdfs dfs -put /opt/hadoop/LICENSE.txt /test/${random}/file1
  Execute        hdfs dfs -get /test/${random}/file1 /tmp/file${random}
  Same files     /tmp/file${random}    /opt/hadoop/LICENSE.txt
  Execute        rm /tmp/file${random}

