import random

def gerar_cpf():
    # Gerando os primeiros 9 dígitos
    cpf = [random.randint(0, 9) for _ in range(9)]

    # Calculando o primeiro dígito verificador
    for _ in range(2):
        val = sum([(len(cpf)+1-i) * v for i, v in enumerate(cpf)]) % 11
        cpf.append(0 if val < 2 else 11 - val)

    # Formatando o CPF
    cpf_formatado = f"{''.join(map(str, cpf[:3]))}.{''.join(map(str, cpf[3:6]))}.{''.join(map(str, cpf[6:9]))}-{''.join(map(str, cpf[9:]))}"
    return cpf_formatado
