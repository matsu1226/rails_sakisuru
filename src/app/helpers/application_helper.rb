module ApplicationHelper
  def full_title(page_title = '')
    base_title = "サキスル - 限りある時間を有効にするサービス" 
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end
end
