
function tableName(id){
    return 'table_'+id;
}

function inputName(id){
    return 'input_'+id;
}

function hiddenName(id, heading) {
    return 'table_'+id+'_'+heading+'[]';
}

function sortTable(table){
    if ($('#'+table+' >tbody >tr').length > 1) {
        $('#'+table).tablesorter({sortList: [[0,0]]});
    }
}

function createRow(id, heading, combos, row) {
    $row = $('<tr/>');
    $hidden_input = $('<input type="hidden" name="'+tableName(id)+'_id[]"/>');
    $hidden_input.val(row.id);
    for (var i in heading) {
        $data = $('<td/>');
        if ((combos != null) && (combos[heading[i]] != null)) {
            $combo = $('<select name= "'+hiddenName(id, heading[i])+'"/>');
            for (var j in combos[heading[i]]) {
                $option = $('<option/>');
                $option.val(combos[heading[i]][j]);
                $option.text(combos[heading[i]][j]);
                if (row[heading[i]] == combos[heading[i]][j]) {
                    $option.attr("selected", "selected");
                }
                $combo.append($option);
            }
            $data.append($combo);
        } else {
            $data.text(row[heading[i]]);
            $hidden_field = $('<input type="hidden" name="'+hiddenName(id, heading[i])+'"/>');
            $hidden_field.val(row[heading[i]]);
            $data.append($hidden_field);
        }
        if ($hidden_input != null) {
            $data.append($hidden_input);
            $hidden_input = null;
        }
        $row.append($data);
    }
    $row.append($('<td class="remove"/>').append($('<button type="button"/>').text("Remove")));
    return $row;
}

function createTable(id, heading, values, combos) {
    var $table = $('<table id="'+tableName(id)+'" class="tablesorter" />');
    var $heading = $('<thead/>');
    var $row = $('<tr/>');
    for (var i in heading) {
        $label = $('<th/>');
        $label.text(heading[i]);
        $row.append($label);
    }
    $row.append($('<th/>'));
    $heading.append($row);
    $table.append($heading);

    $body = $('<tbody/>');
    for (var row in values) {
        $row = createRow(id, heading, combos, values[row]);
        $body.append($row);
    }
    $table.append($body);

    return $table;
}

function autocompleteTable(obj, options) {

    var $input = $('<input id="'+inputName(options.id)+'" type="text" />');
    obj.append($input);

    $table = createTable(options.id, options.heading, options.values, options.combos);
    obj.append($table);

    sortTable(tableName(options.id));
    $input.autocomplete({
        minLength: 2,
        source : options.url(),
        select: function(event, ui) {
            //var $r = createRow(options.id, options.heading, options.combos, {id:ui.item.id, name:ui.item.name, mode:ui.item.mode});
            var $r = createRow(options.id, options.heading, options.combos, ui.item);
            $table.find('tbody').append($r);
            //Sort table duplicates the rows - not what I want
            //sortTable(tableName(options.id));
        }
    })
    .data('autocomplete')._renderItem = function( ul, item ) {
        if ($table.find('input[type=hidden][value='+item.id+']').length == 0) {
            return $( '<li></li>' )
                .data( 'item.autocomplete', item)
                .append( '<a>' + item[options.search] + '</a>' )
                .appendTo( ul );
        }
        return false;
    };
    $('.remove button').live('click', function(event){
        event.preventDefault();
        $(this).closest('tr').remove();
    });
    // prevent auto-posting when user hits enter
    $('#select_origin').keydown(function(evt) {
       if( evt.which == 13 ) {
           evt.preventDefault();
       }
    });

}

$.fn.completable_table = function(options) {
    autocompleteTable(this, options);
};