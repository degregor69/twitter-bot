require 'dotenv'# Appelle la gem Dotenv
require 'pry' #Appelle la gem pry
require 'twitter' #Appelle la gem twitter

Dotenv.load # Ceci appelle le fichier .env grâce à la gem Dotenv, et importe toutes les données enregistrées dans un hash ENV
 
 # quelques lignes qui appellent les clés d'API de ton fichier .env
 def login_twitter
	client = Twitter::REST::Client.new do |config|
	config.consumer_key        = ENV["TWITTER_CONSUMER_KEY"]
	config.consumer_secret     = ENV["TWITTER_CONSUMER_SECRET"]
	config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
	config.access_token_secret = ENV["TWITTER_ACCESS_TOKEN_SECRET"]
end
	return client
end
 
 # ligne qui permet de tweeter sur ton compte
 #client.update('Mon deuxième tweet !')