module IntelligentTableHelper
  def intelligent_table(table_id, url, headings, id_field, values)
    html = generate_html(table_id, headings, values)
    script = generate_script(table_id, url, id_field)
    raw(html + script)
  end

  def generate_html(table_id, headings, values)
    html = "<div style='position:relative;' id='div_#{table_id}'>\n" +
    "  <input id='input_#{table_id}'/>\n" +
    "</div>\n" +

    "<table id='#{table_id}' class='tablesorter'>\n" +
    "  <thead>\n" +
    "    <tr>\n"
      headings.each do |heading|
        html += "      <th>#{heading.capitalize}</th>\n"
      end
      html += "      <th></th>\n" +
    "    </tr>\n" +
    "  </thead>\n" +
    "  <tbody>\n"
    values.each do |row|
      html += "    <tr>\n"
      hidden_input = "<input type='hidden' name='#{table_id}_id[]' value='#{row[:id]}' />\n"
      headings.each do |heading|
        html += "      <td>#{hidden_input} #{row[heading]}"
        hidden_input = ""
      end
      html += "      <td class='remove'><button type='button'>Remove</button></td>\n" +
      "    </tr>\n"
    end
      html += "  </tbody>\n" +
    "</table>\n"
    html
  end


  def generate_script(table_id, url, id_field)
    script = "<script type='text/javascript'>\n" +
      "function sortTable(){\n" +
      "  if ($('##{table_id} >tbody >tr').length > 1) {\n" +
      "    $('##{table_id}').tablesorter({sortList: [[0,0]]});\n" +
      "  }\n" +
      "}\n" +
      "function showMessage(msg,duration) {\n" +
      "    var $msg = $('<div />');\n" +
      "    $msg.css({\n" +
      "       position: 'absolute',\n" +
      "        top:0,\n" +
      "        left:300\n" +
      "    });\n" +
      "    $msg.html(msg);\n" +
      "    $msg.appendTo('#div_#{table_id}');\n" +
      "    setTimeout(function() {\n" +
      "        $msg.fadeOut();\n" +
      "    }, duration);\n" +

      "}\n" +
    "$(function() {\n" +

    "   sortTable();\n" +
        # Below is the name of the textfield that will be autocomplete
    "   $('#input_#{table_id}').autocomplete({\n" +
            # This shows the min length of charcters that must be typed before the autocomplete looks for a match.
    "        minLength: 2,\n" +
            # This is the source of the auocomplete suggestions. In this case a list of names from the people controller, in JSON format.
    "       source: '#{url}',\n" +
            # This updates the textfield when you move the updown the suggestions list, with your keyboard. In our case it will reflect the same value that you see in the suggestions which is the person.given_name.
    "        focus: function(event, ui) {\n" +
    "            $('#input_#{table_id}').val(ui.item.#{id_field});\n" +
    "            return false;\n" +
    "        },\n" +
            # Once a value in the drop down list is selected, do the following:
    "        select: function(event, ui) {\n" +
    "            if ($('##{table_id} input[name=\"#{table_id}_id[]\"][value='+ui.item.id+']').length == 0) {\n" +

                    # place the person.given_name value into the textfield called 'select_origin'...
    "               $('#input_#{table_id}').val(ui.item.#{id_field});\n" +
    "                var $cell = $('<td />').text(ui.item.#{id_field}).append('<input type=\"hidden\" name=\"#{table_id}_id[]\" value=\"'+ui.item.id+'\" />');\n" +
    "                var $newRow = $('<tr><td class=\"remove\"><button type=\"button\">Remove</button></td></tr>');\n" +
    "                $newRow.prepend($cell);\n" +
    "                $('##{table_id}').append($newRow);\n" +
                    #sortTable();\n" +
    "            } else {\n" +
    "                showMessage(''+ui.item.#{id_field}+' already added', 2000);\n" +
    "            }\n" +

    "            return false;\n" +
    "        }\n" +
    "    })\n" +
        # The below code is straight from the jQuery example. It formats what data is displayed in the dropdown box, and can be customized.
    "    .data( 'autocomplete' )._renderItem = function( ul, item ) {\n" +
    "        if ($('##{table_id} input[name=\"#{table_id}_id[]\"][value='+item.id+']').length == 0) {\n" +

    "        return $( '<li></li>' )\n" +
    "            .data( 'item.autocomplete', item )\n" +
                # For now which just want to show the person.given_name in the list.
    "            .append( '<a>' + item.#{id_field} + '</a>' )\n" +
    "            .appendTo( ul );\n" +
    "        }\n" +
    "    };\n" +
    "    $('.remove button').live('click', function(event){\n" +
    "        event.preventDefault();\n" +
    "        $(this).closest('tr').remove();\n" +
    "    });\n" +
    "    $('#select_origin').keydown(function(evt) {\n" +
    "       if( evt.which == 13 ) {\n" +
    "           evt.preventDefault();\n" +
    "       }\n" +
    "    });\n" +
    "});\n" +

    "</script>"
    script
  end

end
