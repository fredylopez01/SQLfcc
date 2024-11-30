#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo "Enter your username:"
read USERNAME

GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM games WHERE username = '$USERNAME'")

if [[ GAMES_PLAYED -gt 0 ]]
then 
  BEST_GAME=$($PSQL "SELECT MIN(tries) FROM games WHERE username = '$USERNAME'")
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
else
  echo "Welcome, $USERNAME! It looks like this is your first time here."
fi

SECRET_NUMBER=$(( $RANDOM % 1000 + 1 ))

echo "Guess the secret number between 1 and 1000:"
read NUMBER

while [[ ! "$NUMBER" =~ ^-?[0-9]+$ ]]
do
  echo "That is not an integer, guess again:"
  read NUMBER
done

NUMBER_OF_GUESSES=1

while [[ NUMBER -ne SECRET_NUMBER ]]
do
  if [[ NUMBER -gt SECRET_NUMBER ]]
  then
    echo "It's lower than that, guess again:"
    read NUMBER
  else
    echo "It's higher than that, guess again:"
    read NUMBER
  fi
  ((NUMBER_OF_GUESSES++));
done

RESULT_INSERT_END=$($PSQL "INSERT INTO games VALUES('$USERNAME', '$NUMBER_OF_GUESSES')")
echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"

exit 0