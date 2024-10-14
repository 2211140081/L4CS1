require 'bcrypt'

#ユーザー登録アクション
signup_password = BCrypt::Password.create("my password")
puts signup_password

#ログインアクション
if User.find_by(uid: params[:uid])
    login_password = BCrypt::Password.new(signup_password)
    if login_password == "my password"
        p "ログイン成功"
    end
end