📄 Script - Limpeza de Ficheiros Temporários (Windows)\
📚 Enquadramento
O objetivo de este script é automatizar a limpeza de ficheiros temporários do sistema operativo Windows, contribuindo para a otimização do desempenho e libertação de espaço em disco.
________________________________________
⚙️ Descrição do Funcionamento\
O script executa várias operações de forma automática:
🔹 Elevação de Privilégios
•	Verifica se o script corre com permissões de administrador
•	Caso não esteja, solicita automaticamente elevação via UAC
•	Garante acesso às pastas protegidas do sistema.
________________________________________
🔹 Limpeza da Pasta Temporária do Utilizador
%temp%
•	Remove todos os ficheiros temporários do utilizador atual
•	Elimina também subpastas existentes
•	Utiliza comandos forçados para garantir a limpeza completa
________________________________________
🔹 Limpeza da Pasta Temporária do Sistema
%systemroot%\temp
•	Remove ficheiros temporários do sistema Windows
•	Necessita privilégios de administrador
•	Contribui para a estabilidade e desempenho do sistema
________________________________________
🔹 Feedback ao Utilizador
•	Apresenta mensagens no terminal durante a execução
•	Informa quando a limpeza é concluída com sucesso
•	Utiliza pause para permitir a visualização do resultado
________________________________________
🎯 Objetivo do Script\
•	Automatizar tarefas de manutenção do sistema
•	Libertar espaço em disco
•	Melhorar o desempenho geral
•	Aplicar boas práticas de administração de sistemas
________________________________________
🛠️ Tecnologias Utilizadas\
•	Batch scripting (Windows CMD)
•	Variáveis de ambiente do Windows
•	Controlo de permissões (UAC)
________________________________________
⚠️ Notas Importantes\
•	Deve ser executado como administrador
•	Alguns ficheiros podem não ser removidos se estiverem em uso
•	Recomenda-se fechar aplicações antes da execução
________________________________________
🚀 Nota Final  
Este script demonstra a importância da automação na administração de sistemas, permitindo executar tarefas repetitivas de forma rápida, eficiente e segura.

Link: https://github.com/FranciscoJoseReis/windows-temp-cleanup-script

