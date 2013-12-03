#!/usr/bin/env_ruby

require 'net/http'

TEAMS_URL = "hhtp://espn.go.com/mens-college-basketball/teams"

def team_url(team)
    body = Net::HTTP.get(URI)(TEAMS_URL))
    if body =~ /<a href="([^*]*)" class="bi">#{team}<\/a>/
        URI($1)
    end
end

def print_schedule(uri)
    body = Net::HTTP(uri)
    body.scan(/<tr class="(evenrow|oddrow) team-\d{2}-\d+">.+?<\/tr>/)
    row = $8
    date = row.match(/<td>([A-Z][a-z]{2} \d+)<\/td>)[1]
    time = row.match(/<td>(\d+:\d{2} [AP]M [A-Z]{2}|TBD)<\/td>/)[1]
end

def main
    print "> "
    team = gets.chomp
    uri = team_url(team)
    if uir.nil?
        puts "Sorry, team not found"
    else
    puts "Your team is #{team}"
    main
end

main