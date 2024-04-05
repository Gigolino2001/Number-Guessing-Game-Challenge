#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

USER(){

  echo -e "\nEnter your username:\n"
  read USERNAME

  # get user id from db
  USER_ID=$($PSQL "select user_id from users where username = '$USERNAME'")
  echo $USER_ID
  if [[ ! -z $USER_ID ]]
    then
    GAME_PLAYED=$($PSQL "select frequent_games from users where user_id = $USER_ID")
    BEST_GUESS=$($PSQL "SELECT MIN(best_guess) FROM users LEFT JOIN games USING(user_id) WHERE user_id=$USER_ID")
    echo -e "Welcome back, $USERNAME! You have played $GAME_PLAYED games, and your best game took $BEST_GUESS guesses."
    NEW_GAME=$($PSQL "UPDATE users SET frequent_games = frequent_games + 1 where user_id = $USER_ID")
  else
    echo -e "Welcome, $USERNAME! It looks like this is your first time here."
    INSERTED_TO_USERS=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
    USER_ID=$($PSQL "select user_id from users where username = '$USERNAME'")
    NEW_GAME=$($PSQL "UPDATE users SET frequent_games = frequent_games + 1 where user_id = $USER_ID")
  fi


  GAME
}

GAME(){

  SECRET=$((1 + $RANDOM % 1000))
  TRIES=0
  GUESSED=0
  echo -e "\nGuess the secret number between 1 and 1000:"

   while [[ $GUESSED = 0 ]]; do
    read GUESS

    #if not a number
    if [[ ! $GUESS =~ ^[0-9]+$ ]]; then
      echo -e "\nThat is not an integer, guess again:"
    #if correct guess
    elif [[ $SECRET = $GUESS ]]; then
      TRIES=$(($TRIES + 1))
      echo -e "You guessed it in $TRIES tries. The secret number was $SECRET. Nice job!"
      #insert into db
      INSERTED_TO_GAMES=$($PSQL "INSERT INTO games(user_id, best_guess) VALUES($USER_ID, $TRIES)")
      GUESSED=1
    elif [[ $SECRET -gt $GUESS ]]; then
      TRIES=$(($TRIES + 1))
      echo -e "\nIt's higher than that, guess again:"
    else
      TRIES=$(($TRIES + 1))
      echo -e "\nIt's lower than that, guess again:"
    fi
  done
}


USER
