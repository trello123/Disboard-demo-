desc "position reset"
namespace :data do
    task :generate_pos => :environment do
        Card.all.each.with_index(1) do |card, i|
            card.update(position: i)
        end
    end
end