#encoding: utf-8
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require 'sqlite3'
#  создаем бд
set :database, {adapter: "sqlite3", database: "lepra.db"}
# Класс для постов, наследование от актив рекорд
class Post < ActiveRecord::Base
  validates :name, presence: true, length: {minimum:  3}
  validates :post, presence: true
  has_many :comments
end
# Класс для коментов, наследование от актив рекорд
class Comment < ActiveRecord::Base
  validates :name, presence: true, length: {minimum:  3}
  validates :comment, presence: true
  belongs_to :post
end

get '/' do
  @posts = Post.order 'created_at DESC'
  erb :index
end
# Предсавления для добавления нового поста
get '/New' do
  erb :new
end
#Добавление нового поста в базу
post '/New' do
  @newpost = Post.new params[:post]
  if @newpost.save
    redirect to('/')
    @congrat = "<h4> Спасибо ! </h4>"
  else
    @error = @newpost.errors.full_messages.first
    erb :new
  end

end

# Вывод информации о посте
get '/detail/:id' do
  # получаем переменную из url
  # получаем пост по ид
  @results = Post.find params[:id]
  # Выбираем коментарии для поста
  @comment = Comment.where("post_id = ?", params[:id])

  erb :detail
end

# Обработчик пост запроса сохранение в бд комент
#(браузер отправляет данные на сервер, мы хи принимаем)
post '/detail/:id' do
  #сохраняем новый коментарий
  @newcomment = Comment.new params[:comment]
  @newcomment.save
  redirect to('/detail/'+ params[:id])
end
