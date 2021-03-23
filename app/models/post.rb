class Post < ApplicationRecord
    validates :title, presence: true
    validates :start_date, presence: true
    validates :end_date, presence: true
    
    validate :correct_date #オリジナルのバリデーション。定義は以下
    
    def correct_date
        begin #例外処理をしている。if文の内容は、日付が入力されていない場合(end_date == nil)にエラーになるため、それを回避。
            if end_date < Date.today #終了日が本日より前の日付の入力を禁止
                errors.add(:end_date, "は今日以降の日付を入力してください。")
            elsif end_date == nil
                errors.add(:end_date, "を入力してください。")
            else
            end
        rescue #例外処理の内容は無し。
        end
        
        begin
            if end_date < start_date #終了日が開始日より前の日付の入力を禁止
                errors.add(:end_date, "は開始日以降の日付を入力してください。")
            elsif end_date == nil
                errors.add(:end_date, "を入力してください。")
            else
            end
        rescue
        end
    end
end
