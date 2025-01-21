#! /bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"
echo -e "\n~~~~~ MY SALON ~~~~~\n"
MAIN_MENU(){
  if [[ $1 ]]
  then
  echo -e "\n$1"
  else
  echo Welcome to My Salon, How can I help you?
  fi
  echo -e "\n1) cut\n2) color\n3) perm\n4) style\n5) trim"
  read SERVICE_ID_SELECTED
  case $SERVICE_ID_SELECTED in
      1) SERVICES 1 ;;
      2) SERVICES 2 ;;
      3) SERVICES 3 ;;
      4) SERVICES 4 ;;
      5) SERVICES 5 ;;
      *) MAIN_MENU "I could not find that service. What would you like today?" ;;
    esac
}
SERVICES(){
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE
  # get customer name
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
  # if customer doesn't exist
  if [[ -z $CUSTOMER_NAME ]]
  then
  # get new customer name
  echo -e "\nI don't have a record for that phone number, what's your name?"
  read CUSTOMER_NAME
  # insert new customer
  INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone,name) VALUES('$CUSTOMER_PHONE','$CUSTOMER_NAME')")
  fi
  # get customer_id
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
  # get service name
  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$1")
  # get new appointment time
  echo -e "\nWhat time would you like your $(echo $SERVICE_NAME | sed 's/^ *//g'), $CUSTOMER_NAME?"
  read SERVICE_TIME
  # insert new appointment
  INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id,service_id,time) VALUES($CUSTOMER_ID,$1,'$SERVICE_TIME')")
  echo -e "\nI have put you down for a $(echo $SERVICE_NAME | sed 's/^ *//g') at $SERVICE_TIME, $CUSTOMER_NAME."

}
MAIN_MENU