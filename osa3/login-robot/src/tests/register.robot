*** Settings ***
Resource  resource.robot

*** Test Cases ***
Register With Valid Username And Password
  Create User  kalle  kalle123

Register With Already Taken Username And Valid Password
  Create User  kalle  kalle123
  Run Keyword And Expect Error  User with username kalle already exists  Create User  kalle  kalle123

Register With Too Short Username And Valid Password
  Run Keyword And Expect Error  *Username is too short  Create User  a  kalle123
  Run Keyword And Expect Error  *Username is too short  Create User  aa  kalle123

Register With Enough Long But Invalid Username And Valid Password
  Run Keyword And Expect Error  *Username must only contain lowercase letters  Create User  1234  kalle123

Register With Valid Username And Too Short Password
  Run Keyword And Expect Error  *Password is too short  Create User  kalle  kalle
  Run Keyword And Expect Error  *Password is too short  Create User  kalle  kalle12

Register With Valid Username And Long Enough Password Containing Only Letters
  Run Keyword And Expect Error  *Password must contain at least one number  Create User  kalle  kallekalle
