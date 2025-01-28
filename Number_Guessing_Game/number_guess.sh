#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guessing_game --tuples-only -c"

GENERATE_RANDOM_NUMBER(){
  # Generate a random number between 1 and 1000
  RANDOM_NUMBER=$(( ( RANDOM % 1000 ) + 1 ))
}
# increment number of try
GUESS_COUNT=0

GUESS_NUMBER(){
  echo $1
  read NUMBER
  ((GUESS_COUNT++))
  if [[ ! $NUMBER =~ ^[0-9]+$ ]]
  then
  # check if it is a valid number
    GUESS_NUMBER "That is not an integer, guess again:"
  elif [[ $NUMBER -lt $RANDOM_NUMBER ]]
  then
  # check if it is a lower number
    GUESS_NUMBER "It's higher than that, guess again:"
  elif [[ $NUMBER -gt $RANDOM_NUMBER ]]
  then
  # check if it is a higher number
    GUESS_NUMBER "It's lower than that, guess again:"
  else
  # insert if guessed correctly
    INSERT_GAME_SCORE=$($PSQL "INSERT INTO game_info(game_score, user_id) VALUES($GUESS_COUNT, $USER_ID)")
    echo "You guessed it in $GUESS_COUNT tries. The secret number was $RANDOM_NUMBER. Nice job!"
  fi
}

START_GAME(){
  GENERATE_RANDOM_NUMBER
  echo Enter your username:
  read USER_NAME
  # get user_info
  USER_ID=$($PSQL "SELECT user_id FROM user_info WHERE user_name='$USER_NAME'")
  if [[ -z $USER_ID ]]
  then
    # if user doesn't exist
    INSERT_USER=$($PSQL "INSERT INTO user_info(user_name) VALUES('$USER_NAME')")
    USER_ID=$($PSQL "SELECT user_id FROM user_info WHERE user_name='$USER_NAME'")
    echo $USER_ID
    echo "Welcome, $USER_NAME! It looks like this is your first time here."
    GUESS_NUMBER "Guess the secret number between 1 and 1000:"
  else
    # if user exist
    GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM user_info WHERE user_id=$USER_ID")
    BEST_GAME=$($PSQL "SELECT MIN(game_score) FROM game_info WHERE user_id=$USER_ID")
    echo "Welcome back, $USER_NAME! You have played $(echo $GAMES_PLAYED | sed 's/^ *//g') games, and your best game took $(echo $BEST_GAME | sed 's/^ *//g') guesses."
    GUESS_NUMBER "Guess the secret number between 1 and 1000:"
  fi
}

START_GAME
