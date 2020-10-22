# MovieDB

## User

### 🔑user_id
user_name
password
email
phone

## user_review

### 🔑user_id
🔑review_id

## review

### 🔑review_id
rate
review

## user_banList

### 🔑user_id
banList(user_id)

## user_wishList

### 🔑user_id
wishList(movie_id)

## movie_review

### 🔑review_id
🔑movie_id

## Movie

### 🔑movie_id
title
releaseTime
rate
rateNumber
overview

## movie_releaseTime

### 🔑movie_id
🔑releaseTime_id

## releaseTime

### 🔑releaseTime_id
time_area

## movie_type

### 🔑movie_id
🔑type_id

## type

### 🔑type_id
type

## actor

### 🔑actor_id
name
sex
birthday

## movie_director

### 🔑movie_id
🔑director_id(actor_id)

## movie_actor

### 🔑movie_id
actor_id

*XMind - Trial Version*