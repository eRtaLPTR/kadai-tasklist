class ToppagesController < ApplicationController
  def index
    if logged_in?
      # logged_in?はSessionsHelperに定義すべきもの
      # ただ、そこに書いただけだと読み込めないので、Controller側で使えるようにする。
      # Helperモジュール内で定義したメソッドは、Viewでしか使えない。
      # なので大元のApplicationControllerにMix-inしている。
      @task = current_user.tasks.build
      @tasks = current_user.tasks.order('created_at DESC').page(params[:page])
    end
  end
end
