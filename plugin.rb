#!/bin/env ruby
# encoding: utf-8
# name: youriguide.com Onebox
# version: 0.1
# authors: planitar


register_css <<CSS

.youriguide-embed {
    position: relative;
    height: 394px;
}

.youriguide-frame {
    border: none;
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

    REGEX = /^https?:\/\/(?:www\.)?youriguide\.com\/(?:embed\/)?(.*?)$/i
    
    matches_regexp REGEX

    def id
        @url.match(REGEX)[1]
    end

    def to_html
        <<HTML
        <pre>
        #{id}
        </pre>
        <div class="youriguide-embed">
                <iframe class="youriguide-frame" src="https://youriguide.com/embed/#{id}" scrolling="no" frameborder="0" allowfullscreen></iframe></div>
        </div>
HTML
    end
end
