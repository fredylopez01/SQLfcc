#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
echo "$($PSQL "TRUNCATE TABLE games, teams;")"

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WGOALS OGOALS
do
  if [[ $YEAR != "year" ]]
  then
    
    # get winner id
    W_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER'")
    
    # if not found
    if [[ -z $W_ID ]]
    then
      # insert winner
      INSERT_WINNER_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
      if [[ $INSERT_WINNER_RESULT == "INSERT 0 1" ]]
      then
        echo Inserted into teams, $WINNER
      fi
      W_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER'")
    fi

    # get opponent id
    O_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT'")

    # if not foun
    if [[ -z $O_ID ]]
    then
      # inset opponent
      INSERT_OPPONENT_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
      if [[ $INSERT_OPPONENT_RESULT == "INSERT 0 1" ]]
      then
        echo Inserted into teams: , $OPPONENT OPPONENT
      fi
      O_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT'")
    fi
    
    # insert game
    INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $W_ID, $O_ID, $WGOALS, $OGOALS)")
    if [[ $INSERT_GAME_RESULT == "INSERT 0 1" ]]
    then
      echo Inserted into games, $YEAR, $ROUND, $W_ID, $O_ID, $WGOALS, $OGOALS
    fi
  fi
done