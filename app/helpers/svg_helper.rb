module SvgHelper
    def svg(svg_name, **attributes)
        svg_markup = render file:
            "#{Rails.root}/app/views/shared/svg/#{svg_name}.svg"

        xml = Nokogiri::xml(svg_markup)
        attributes&.each do |key, value|
            xml.root.set_attributes(key, value)
        end

        xml.root.to_xml.html_safe
    end
end