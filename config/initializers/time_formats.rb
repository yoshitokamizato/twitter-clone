# カスタムフォーマットを定義
# Time::DATE_FORMATS[:published_on] = "%Y年%m月%d日 %H時%M分"
# Date::DATE_FORMATS[:default]      = "%Y年%m月d日"
Time::DATE_FORMATS[:default] = '%Y-%m-%d %H:%M'
Time::DATE_FORMATS[:datetime] = '%Y-%m-%d %H:%M'
Time::DATE_FORMATS[:date] = '%Y-%m-%d'
Time::DATE_FORMATS[:time] = '%H:%M:%S'
Date::DATE_FORMATS[:default] = '%Y-%m-%d'