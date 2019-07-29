#encoding: utf-8
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require 'SQLite3'
#  создаем бд
set :database, {adapter: 'sqlite3', database: 'lepra.db'}

class Post < ActiveRecord::Base

end

class Comment < ActiveRecord::Base

end

