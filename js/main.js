$(document).ready(function(){
  var heroesArray = [];
  var teamsArray = [];
  var selectedTeam = 1;

  $.post( "include/getTeams.php", {
  }, function(response,status){
      teamsArray = JSON.parse(response)
      //filter time on difficulty then sort on time after that sort on clicks

      for(var i = 0; i < teamsArray.length-1; i++){
        var lastRepeatingGroup = $('.teamRepeat').last();
        var cloned = lastRepeatingGroup.clone(true)
        cloned.insertAfter(lastRepeatingGroup);
        resetAttributeNames(cloned);
      }
      for(var i = 1; i < teamsArray.length+1; i++){
        $('#teamName_'+i).text(teamsArray[i-1].name);
        $('#teamImage_'+i).attr("src","img/"+teamsArray[i-1].image);
      }
  });

  getHeroes(selectedTeam,0);

  $('.teamRepeat').click(function(e){
    selectedTeam = $(this).children().attr('id').split('_')[1];
    var lastRepeatingGroup = $('.repeatingSection').last();
    $('.repeatingSection').slice(1).remove();
    console.log()
    getHeroes(teamsArray[selectedTeam-1].id,selectedTeam-1);
  });


  $('.addHero').click(function(e){
    var lastNum;
    if($('.repeatingSection').length == 1 && $('.repeatingSection').attr("class").split(" ")[1] == "hidden"){
      lastNum = 0;
      $('.repeatingSection').removeClass("hidden");
    }else{
      var template = $('.templateSection');
      var lastRepeatingGroup = $('.repeatingSection').last();
      var cloned = lastRepeatingGroup.clone(true);
      cloned.insertAfter(lastRepeatingGroup);
      resetAttributeNames(cloned);
      lastNum = parseInt(lastRepeatingGroup.clone(true).children().attr('id').split('_')[1]);
    }
    $('#id_'+(lastNum+1)).val('');
    $('#name_'+(lastNum+1)).val('');
    $('#power_'+(lastNum+1)).val('');
    $('#description_'+(lastNum+1)).val('');
    $('#image_'+(lastNum+1)).val('');
    $('#teams_id_'+(lastNum+1)).val(teamsArray[selectedTeam-1].id)
    $('#update_'+(lastNum+1)).val('add');
    $('#update_'+(lastNum+1)).removeClass('js-update');
    $('#update_'+(lastNum+1)).addClass('js-add');
    $("html, body").animate({ scrollTop: $(document).height() }, "fast");
  });

    // Delete a repeating section
  $('.deleteHero').click(function(e){
    // e.preventDefault();
    var a_selected = $(this).attr('id').split('_')[1];
    var a_current_hero = $(this).parent('div');
    var a_other_heroes = a_current_hero.siblings('.repeatingSection');
    console.log(a_other_heroes.length);
    if (a_other_heroes.length <= 4) {
        alert("You should atleast have 5 heroes");
        return;
    }
    a_current_hero.slideUp('slow', function() {
      if(a_selected <= heroesArray.length){
        $.post( "include/deleteHero.php", {
          id: $('#id_'+a_selected).val().replace("\'", "")
        }, function(response,status){
          if(response == "error"){
            console.log('cannot delete heroes who have comments');
          }else{
            console.log('hero succesfuly deleted');
          }
        });
      }

      a_current_hero.remove();

      // reset fight indexes
      a_other_heroes.each(function() {
         resetAttributeNames($(this));
      })
    })
  });

  $('.js-update').on('click',function(){
    var a_selected = $(this).attr('id').split('_')[1];

    $.post( "include/updateHeroes.php", {
      id: $('#id_'+a_selected).val().replace("\'", ""),
      name: $('#name_'+a_selected).val().replace("\'", ""),
      power: $('#power_'+a_selected).val().replace("\'", ""),
      description: $('#description_'+a_selected).val().replace("\'", ""),
      image: $('#image_'+a_selected).val().replace("\'", ""),
      team: $('#teams_id_'+a_selected).val().replace("\'", "")
    }, function(response,status){
        if(response == "\"succes\""){
          console.log('succesfuly updated item '+$('#id_'+a_selected).val());
        }else{
          console.log(response)
        }
      }
    );
  })

  $('body').on('click','.js-add',function(){
    console.log("add")
    var a_formId = $(this).attr('id').split('_')[1];

    $.post( "include/addHero.php", {
      name: $('#name_'+a_formId).val().replace("\'", ""),
      power: $('#power_'+a_formId).val().replace("\'", ""),
      description: $('#description_'+a_formId).val().replace("\'", ""),
      image: $('#image_'+a_formId).val().replace("\'", ""),
      team: $('#teams_id_'+a_formId).val().replace("\'", "")
    }, function(response,status){
      console.log(response)
        if(response == "succes"){
          console.log("hero succesfuly added");
          location.reload();
        }
      }
    );
  })

  $('.updateTeam').on('click',function(){
    $.post( "include/updateTeam.php", {
      id: $('.inputTeamId').val().replace("\'", ""),
      name: $('.inputTeamName').val().replace("\'", ""),
      image: $('.inputTeamImage').val().replace("\'", "")
    }, function(response,status){
        if(response == "succes"){
          console.log("team updated");
          location.reload();
        }
      }
    );
  })

  $('.newTeam').on('click',function(){
    $.post( "include/addTeam.php", {
      name: $('.newTeamName').val().replace("\'", ""),
      image: $('.newTeamImage').val().replace("\'", "")
    }, function(response,status){
        if(response == "succes"){
          console.log("team added");
          location.reload();
        }
      }
    );
  })

  $('.deleteTeam').on('click',function(){
    $.post( "include/deleteTeam.php", {
      id: $('.inputTeamId').val().replace("\'", "")
    }, function(response,status){
        if(response == "succes"){
          console.log("team deleted");
          location.reload();
        }
        console.log(response)
      }
    );
  })

    // Add a new repeating section
  var attrs = ['for', 'id', 'name'];
  function resetAttributeNames(section) {
      var tags = section.find('input, label, textarea, a, div, img'), idx = section.index();
      tags.each(function() {
        var $this = $(this);
        $.each(attrs, function(i, attr) {
          var attr_val = $this.attr(attr);
          if (attr_val) {
            $this.attr(attr, attr_val.replace(/_\d+$/, '_'+(idx + 1)))
          }
        })
      })
  }

  function addHero(){
      var lastRepeatingGroup = $('.repeatingSection').last();
      var cloned = lastRepeatingGroup.clone(true)
      cloned.insertAfter(lastRepeatingGroup);
      resetAttributeNames(cloned)
  }

  function getHeroes (id,arrayNum){
    setTimeout(function(){
      $('.inputTeamName').val(teamsArray[arrayNum].name);
      $('.inputTeamImage').val(teamsArray[arrayNum].image);
      $('.inputTeamId').val(teamsArray[arrayNum].id);
    }, 25);
    $.post( "include/getHeroes.php", {
      id: id
      }, function(response,status){

        heroesArray = JSON.parse(response)
        if(heroesArray.length >= 1){
          $('.repeatingSection').removeClass("hidden");

          for(var i = 0; i < heroesArray.length-1; i++){
            addHero();
          }
          for(var i = 1; i < heroesArray.length+1; i++){
            $('#id_'+i).val(heroesArray[i-1].id);
            $('#name_'+i).val(heroesArray[i-1].name);
            $('#power_'+i).val(heroesArray[i-1].power);
            $('#description_'+i).val(heroesArray[i-1].description);
            $('#image_'+i).val(heroesArray[i-1].image);
            $('#teams_id_'+i).val(heroesArray[i-1].teams_id);
          }
        }else{
          console.log("empty")
          $('.repeatingSection').addClass("hidden");
        }
      });
  }
});
