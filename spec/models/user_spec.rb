# デフォルトで記述が存在する（ファイルの読み込みを行なっている）
require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    # ユーザー新規登録についてのテストコードを記述します
    it 'nicknameが空では登録できない' do
      # nicknameが空では登録できないテストコードを記述します
    end
    it 'emailが空では登録できない'
      # emailが空では登録ができないテストコードを記述します
    end
  end
end
