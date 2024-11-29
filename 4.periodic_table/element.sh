#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
  exit 0
fi

get_element_info() {
  local INPUT=$1
  local QUERY_RESULT

  if [[ "$INPUT" =~ ^[0-9]+$ ]]
  then
    QUERY_RESULT=$($PSQL "
      SELECT atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius
      FROM elements
      FULL JOIN properties USING(atomic_number)
      FULL JOIN types USING(type_id)
      WHERE atomic_number = '$INPUT';
    ")
  else
    QUERY_RESULT=$($PSQL "
      SELECT atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius
      FROM elements
      FULL JOIN properties USING(atomic_number)
      FULL JOIN types USING(type_id)
      WHERE symbol = '$INPUT' OR name ILIKE '$INPUT';
    ")
  fi

  if [[ -z $QUERY_RESULT ]] 
  then
    echo "I could not find that element in the database."
  else
    IFS="|" read -r ATOMIC_NUMBER NAME SYMBOL TYPE MASS MELTING BOILING <<< "$QUERY_RESULT"
    echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."
  fi
}

get_element_info "$1"
