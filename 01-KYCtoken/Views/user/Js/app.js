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



  const monthNames = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];

  // Get the current date
  const currentDate = new Date();
    
  // Format the date as "DD MMM, YYYY" (e.g., "25 Dec, 2023")
  const formattedDate = currentDate.getDate() + ' ' + 
                        monthNames[currentDate.getMonth()] + ', ' + 
                        currentDate.getFullYear();
  
  // Set the formatted date as the value of the input field
  document.getElementById('birthdate').value = formattedDate;