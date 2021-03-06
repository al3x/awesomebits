atom_feed(language: I18n.locale) do |feed|
  feed.title t('feed.title')
  feed.updated @projects[0].updated_at unless @projects.empty?

  @projects.each do |project|
    feed.entry(project, :published => project.funded_on) do |entry|
      entry.title "#{project.chapter.name} – #{project.title}"
      entry.content(project.funded_description, type: 'html')
      entry.link(href: project.primary_image.url, rel: 'enclosure', type: 'image/jpeg')

      entry.author do |author|
        author.name project.name
      end
    end
  end
end
