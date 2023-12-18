class Admin::GenresController < ApplicationController

  def index
    @genres= Genre.all
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to admin_genres_path
    else
      @genres = Genre.all
      render 'index'
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      redirect_to admin_genres_path
    else
      render "edit"
    end
  end

  private
  #ストロングパラメータ
  #require=>送られてきたデータの中からモデル名（:genre）を指定し、データを絞り込む。
  #permit=>上記で絞り込んだデータの中から、保存を許可するカラムを指定（:name）
  def genre_params
    params.require(:genre).permit(:name)
  end

end
