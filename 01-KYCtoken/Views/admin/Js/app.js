let currentStep = 0;
  const steps = document.querySelectorAll('.step');

  function showStep(step) {
    steps.forEach((stepElement, index) => {
      if (index === step) {
        stepElement.style.display = 'block';
      } else {
        stepElement.style.display = 'none';
      }
    });
  }

  function nextStep() {
    if (currentStep < steps.length - 1) {
      currentStep++;
      showStep(currentStep);
    }
  }

  function prevStep() {
    if (currentStep > 0) {
      currentStep--;
      showStep(currentStep);
    }
  }

  showStep(currentStep);




   document.querySelectorAll('.container-fluid .nav-link').forEach(function(tab) {
      tab.addEventListener('click', function() {
        document.querySelectorAll('.nav-link').forEach(function(tab) {
          tab.classList.remove('active');
        });
        tab.classList.add('active');
     
        var target = tab.getAttribute('data-bs-target');
        document.querySelectorAll('.tab-pane').forEach(function(tabPane) {
          tabPane.classList.remove('show', 'active');
        });
        document.querySelector(target).classList.add('show', 'active');
      });
    });
     
    var casesMenu = document.querySelector('.nav-item');
    var casesSubMenu = casesMenu.querySelector('.nav-treeview');
     
    casesMenu.addEventListener('click', function() {
        debugger
        casesSubMenu.style.display = 'block';
    });

    
// var dropdownToggles = document.querySelectorAll('.sidebar .nav-item.dropdown-list');
// dropdownToggles.forEach(function(toggle) {
//   toggle.addEventListener('click', function(event) {
//     event.preventDefault();
    

//     var dropdownMenu = document.querySelector('.dropdown-item-list');
//     if (dropdownMenu.style.display === 'none' || dropdownMenu.style.display === '') {
//       dropdownMenu.style.display = 'block';
//       toggle.querySelector('.right').classList.remove('fa-angle-left');
//       toggle.querySelector('.right').classList.add('fa-angle-down');
//     } else {
//       dropdownMenu.style.display = 'none';
//       toggle.querySelector('.right').classList.remove('fa-angle-down');
//       toggle.querySelector('.right').classList.add('fa-angle-left');
//     }
//   });
// });

// var dropdownToggles = document.querySelectorAll('.sidebar .dropdown-list');
// dropdownToggles.forEach(function(toggle) {
//   toggle.addEventListener('click', function(event) {
//     event.preventDefault();
    
//     var dropdownMenu = toggle.querySelector('.dropdown-item-list');
//     if (dropdownMenu.style.display === 'none' || dropdownMenu.style.display === '') {
//       dropdownMenu.style.display = 'block';
//       toggle.querySelector('.right').classList.remove('fa-angle-left');
//       toggle.querySelector('.right').classList.add('fa-angle-down');
//     } else {
//       dropdownMenu.style.display = 'none';
//       toggle.querySelector('.right').classList.remove('fa-angle-down');
//       toggle.querySelector('.right').classList.add('fa-angle-left');
//     }
//   });
// });


// var dropdownToggles = document.querySelectorAll('.sidebar .nav-item.dropdown-list');

// dropdownToggles.forEach(function(toggle) {
//   toggle.addEventListener('click', function(event) {
//     event.stopPropagation(); 


//     var dropdownMenu = toggle.querySelector('.dropdown-item-list');
//     toggleDropdown(dropdownMenu, toggle);
//   });
// });


// document.body.addEventListener('click', function(event) {
//   closeAllDropdowns();
// });


// function toggleDropdown(dropdownMenu, toggle) {
//   if (dropdownMenu.style.display === 'none' || dropdownMenu.style.display === '') {

//     dropdownMenu.style.display = 'block';
//     toggle.querySelector('.right').classList.remove('fa-angle-left');
//     toggle.querySelector('.right').classList.add('fa-angle-down');
//   } else {
  
//     dropdownMenu.style.display = 'none';
//     toggle.querySelector('.right').classList.remove('fa-angle-down');
//     toggle.querySelector('.right').classList.add('fa-angle-left');
//   }
// }

// function closeAllDropdowns() {
//   var dropdownMenus = document.querySelectorAll('.dropdown-item-list');
//   dropdownMenus.forEach(function(menu) {
//     menu.style.display = 'none';
//     var toggle = menu.parentElement;
//     toggle.querySelector('.right').classList.remove('fa-angle-down');
//     toggle.querySelector('.right').classList.add('fa-angle-left');
//   });
// }

