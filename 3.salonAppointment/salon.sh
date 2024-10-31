#! /bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ MY SALON ~~~~~\n"

MAIN_MENU(){
  if [[ $1 ]]
  then
    echo -e "\n$1"
  else
    echo -e "\nWelcome to My Salon, how can I help you?"
  fi

  # get services
  SERVICES=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id")
  
  # if there are not services
  if [[ -z $SERVICES ]]
  then
    # send to main menu
    MAIN_MENU "There is no services at the moment"
  else
    # display services
    echo "$SERVICES" | while read SERVICE_ID BAR NAME
    do
      echo "$SERVICE_ID) $NAME"
    done

    # ask for the service
    read SERVICE_ID_SELECTED

    # if input is not a number
    if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
    then
      # send to main menu
      MAIN_MENU "I could not find that service. What would you like today?"
    else
      # get service
      SERVICE=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED;")
      echo $SERVICE

      # if that service is not exist
      if [[ -z $SERVICE ]]
      then
        # send to main menu
        MAIN_MENU "I could not find that service. What would you like today?"
      else
        # ask phone 
        echo -e "\nWhat's your phone number?"
        read CUSTOMER_PHONE

        # get customer_id
        CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE';")

        # if customer is not register
        if [[ -z $CUSTOMER_ID ]]
        then
          # ask name
          echo -e "\nI don't have a record for that phone number, what's your name?"
          read CUSTOMER_NAME

          # add customer
          ADD_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE');")
          
          # get customer_id
          CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE';")
        else
          CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE customer_id = '$CUSTOMER_ID';")
        fi
        
        # ask time for the service
        echo -e "\nWhat time would you like your$SERVICE, $CUSTOMER_NAME?"
        read SERVICE_TIME

        ADD_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME');")


        echo -e "I have put you down for a $(echo $SERVICE | sed -r 's/^ *| *$//g') at $SERVICE_TIME, $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')."

      fi
    fi
  fi
  
}

MAIN_MENU