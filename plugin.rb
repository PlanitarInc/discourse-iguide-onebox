#!/bin/env ruby
# encoding: utf-8
# name: youriguide.com Onebox
# version: 0.2
# authors: planitar

require "onebox"

register_css <<CSS

.youriguide-embed {
    position: relative;
    height: 394px;
}

.youriguide-frame {
    border-style: none;
    width: 100%;
    height: 100%;
}
CSS


Onebox = Onebox
class Onebox::Engine::YouriGuideOnebox
    include Onebox::Engine

    def self.priority
        0
    end

    REGEX = /^https?:\/\/(unbranded\.)?youriguide\.com\/(embed\/)?(?<ig>.*?)$/i
    
    matches_regexp REGEX

    def id
        @url.match(REGEX)[:ig]
    end

    def to_html
        <<HTML
        <div class="youriguide-embed">
                <iframe class="youriguide-frame" src="https://youriguide.com/embed/#{id}" scrolling="no" frameborder="0" allowfullscreen></iframe></div>
        </div>
HTML
    end
end
