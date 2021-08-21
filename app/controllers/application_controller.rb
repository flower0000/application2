class ApplicationController < ActionController::Base
 before_action :authenticate_user!,except: [:top]
 #before_actionメソッドは、このコントローラが動作する前に実行される。
 #今回の場合、app/controllers/application_controller.rbファイルに記述したので、
 #すべてのコントローラで、最初にbefore_actionメソッドが実行されます。
 
 #authenticate_userメソッドは、devise側が用意しているメソッドです。
 #:authenticate_user!とすることによって、「ログイン認証されていなければ、ログイン画面へリダイレクトする」機能を実装できます。
 
 #exceptは指定したアクションをbefore_actionの対象から外します。
 #Meshiterroではトップページのみログイン状態に関わらず、アクセス可能とするためにtopアクションを指定しています。
  
 before_action :configure_permitted_parameters, if: :devise_controller?
 
  def after_sign_in_path_for(resource)
    post_images_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
