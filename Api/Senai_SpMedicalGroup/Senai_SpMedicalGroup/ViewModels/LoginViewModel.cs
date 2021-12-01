using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Senai_SpMedicalGroup.ViewModels
{
    public class LoginViewModel
    {
        [Required(ErrorMessage = "Informe seu Email do Usuário")]
        public string email { get; set; }

        [Required(ErrorMessage = "Informe sua Senha do Usuário")]
        public string senha { get; set; }

    }
}
