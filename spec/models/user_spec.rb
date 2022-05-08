# デフォルトで記述が存在する（ファイルの読み込みを行なっている）
require 'rails_helper'

RSpec.describe User, type: :model do
  # beforeそれぞれのテストコードを実行する前に、セットアップを行う
  before do
    @user = FactoryBot.build(:user)
  end

  describe '新規登録' do
    context '新規登録できるとき' do
      it '全て入力されることで登録ができる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      # nicknameのテストコード
      it 'nicknameが空では登録できない' do
        @user.nickname = '' # エラーが起きるのかを確認したいため加え、nicknameを空にしている
        @user.valid? # valid?はバリデーションを実行させてエラーがあるかどうかを判断するメソッド
        expect(@user.errors.full_messages).to include("ニックネームを入力してください") # include内には想定されるエラーメッセージを記載する
      end

      # emailのテストコード
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it 'emailが重複していると登録ができない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
      end
      it 'emailに@を含まない場合は登録できない' do
        @user.email = 'hogehoge'
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールは不正な値です")
      end

      # passwordのテストコード
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください", "パスワードは不正な値です", "パスワード（確認用）とパスワードの入力が一致しません")
      end
      it 'passwordは英字のみでは登録ができない' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません", "パスワードは不正な値です")
      end
      it 'passwordは数字のみでは登録ができない' do
        @user.password = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません", "パスワードは不正な値です")
      end
      it 'passwordは全角を含んでいる場合は登録ができない' do
        @user.password = '00000あ'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません", "パスワードは不正な値です")
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '0836Yn'
        @user.password_confirmation = '0836yn'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end

      # first_nameのテストコード
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名前を入力してください", "名前は不正な値です")
      end
      it 'first_nameは半角を含んでいる場合は登録できない' do
        @user.first_name = '柳沢1'
        @user.valid?
        expect(@user.errors.full_messages).to include("名前は不正な値です")
      end

      # last_nameのテストコード
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字を入力してください", "苗字は不正な値です")
      end
      it 'last_nameは半角を含んでいる場合は登録できない' do
        @user.last_name = '直也1'
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字は不正な値です")
      end

      # first_name_kanaのテストコード
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("ナマエを入力してください", "ナマエは不正な値です")
      end
      it 'first_name_kanaはカナ文字以外では登録できない' do
        @user.first_name_kana = 'やなぎさわ'
        @user.valid?
        expect(@user.errors.full_messages).to include("ナマエは不正な値です")
      end
      it 'first_name_kanaは半角を含んでいる場合は登録できない' do
        @user.first_name_kana = 'ヤナギサワ1'
        @user.valid?
        expect(@user.errors.full_messages).to include("ナマエは不正な値です")
      end

      # last_name_kanaのテストコード
      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("ミョウジを入力してください", "ミョウジは不正な値です")
      end
      it 'last_name_kanaはカナ文字以外では登録できない' do
        @user.last_name_kana = 'なおや'
        @user.valid?
        expect(@user.errors.full_messages).to include("ミョウジは不正な値です")
      end
      it 'last_name_kanaは半角を含んでいる場合は登録できない' do
        @user.last_name_kana = 'ナオヤ1'
        @user.valid?
        expect(@user.errors.full_messages).to include("ミョウジは不正な値です")
      end

      # birthdayのテストコード
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("誕生日を入力してください")
      end
    end
  end
end
