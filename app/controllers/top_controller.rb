require 'bcrypt'

class TopController < ApplicationController
    def main
        if session[:login_uid]
            render "main"
        else
            render "login"
        end
    end
    
    def login
        user = User.find_by(uid: params[:uid])
        login_password = BCrypt::Password.new(user.pass)
        if user && login_password == params[:pass] #and User.find_by(pass: params[:pass]) #params[:uid] == 'kindai' and params[:pass] == 'sanriko'
            p "ログイン成功"
            session[:login_uid] = params[:uid]
            redirect_to top_main_path
        else
            render "error", status: :unprocessable_entity
        end
    end
    
    def logout
        session.delete(:login_uid)
        redirect_to root_path
    end
    
end
