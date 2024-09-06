# frozen_string_literal: true

# db/seeds.rb

puts 'Seeding database with articles'

# Create sample articles
Article.find_or_create_by!(title: 'Adeus da Trindade à professora Edith Salvaterra') do |article|
  article.content = <<~CONTENT
    Há a imperiosa e suprema lei divina, aos crentes, que dita paragem ao esquisito relógio,
    invisível e justamente, colado ao peito de...
  CONTENT
  article.url = 'https://www.telanon.info/sociedade/2024/08/25/45522/adeus-da-trindade-a-professora-edith-salvaterra/'
  article.photo.attach(io: File.open(Rails.root.join('app/assets/images/yes.png')), filename: 'yes.png')
end

Article.find_or_create_by!(
  title: 'Suicídio do MLSTP/Partido Social Democrata nas máscaras da reforma da Justiça'
) do |article|
  article.content = 'De todo espalhafato que veio à praça pública – na terra «tudo é bom!» – ' \
                    'pressentia algo escapado da triste figura política...'
  article.url = 'https://www.telanon.info/suplemento/opiniao/2024/08/04/45300/suicidio-do-mlstp-partido-social-democrata-nas-mascaras-da-reforma-da-justica/'
  article.photo.attach(
    io: File.open(Rails.root.join('app/assets/images/yes.png')),
    filename: 'yes.png'
  )
end

Article.find_or_create_by!(
  title: 'Sal de Ulisses Correia e Silva no tempero da diplomacia do desespero'
) do |article|
  article.content = 'Os cabo-verdianos para São Tomé «ver e crer» no proveito da conferência ' \
                    'internacional de Sal e ao que aprecia a democracia, deveriam...'
  article.url = 'https://www.telanon.info/politica/2024/04/13/43876/sal-de-ulisses-correia-e-silva-no-tempero-da-diplomacia-do-desespero/'
  article.photo.attach(
    io: File.open(Rails.root.join('app/assets/images/yes.png')),
    filename: 'yes.png'
  )
end

puts 'Articles seeded successfully.'
