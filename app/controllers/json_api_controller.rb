class JsonApiController < ApplicationController
    # この↓一文がないとCSRFチェックでこけるので、APIをやりとりしているControllerには必要
    skip_before_filter :verify_authenticity_token

    def create
    # 読み込み時に一度パースが必要
    json_request = JSON.parse(request.body.read)

    # パース後のデータを表示
    # p "json_request => #{json_request}"
    # p "#{json_request.to_hash}"

    # 各要素へのアクセス方法
    # p "glossary => #{json_request["glossary"]}"
    # p "glossary.title => #{json_request["glossary"]["title"]}"

    # この後、postされたデータをDBに突っ込むなり、必要な処理を記述してください。
    if !json_request.blank?
        personal = json_request['image']

    else
        personal = {'status' => 500}
    end

    render :json => personal
    end
end