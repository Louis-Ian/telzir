# TelZir minutos

## Aplicação para calcular custo de ligações de uma empresa fictícia de telefonia

Os custos normalmente são calculados seguindo a seguinte tabela, de acordo com os códigos de área de Origem e Destino:

<table>
    <tr>
        <th>Origem</th>
        <th>Destino</th>
        <th>R$/min</th>
    </tr>
    <tr>
        <td>011</td>
        <td>016</td>
        <td>1.90</td>
    </tr>
    <tr>
        <td>016</td>
        <td>011</td>
        <td>2.90</td>
    </tr>
    <tr>
        <td>011</td>
        <td>017</td>
        <td>1.70</td>
    </tr>
    <tr>
        <td>017</td>
        <td>011</td>
        <td>2.70</td>
    </tr>
    <tr>
        <td>011</td>
        <td>018</td>
        <td>0.90</td>
    </tr>
    <tr>
        <td>018</td>
        <td>011</td>
        <td>1.90</td>
    </tr>
</table>

No entanto, om o novo produto FaleMais da Telzir o cliente adquire um plano e pode falar de graça até
um determinado tempo (em minutos) e só paga os minutos excedentes.
Os minutos excedentes tem um acréscimo de 10% sobre a tarifa normal do minuto.
Os planos são FaleMais 30 (30 minutos), FaleMais 60 (60 minutos) e FaleMais 120 (120 minutos).

Com esta aplicação o cliente pode calcular o valor das ligações com e sem o plano FaleMais
Ex:

<table>
    <tr>
        <th>Origem</th>
        <th>Destino</th>
        <th>Tempo</th>
        <th>Plano FaleMais</th>
        <th>Com FaleMais</th>
        <th>Sem FaleMais</th>
    </tr>   
    <tr>
        <td>011</td>
        <td>016</td>
        <td>20</td>
        <td>FaleMais 30</td>
        <td>R$ 0,00</td>
        <td>R$ 38,00</td>
    </tr>
    <tr>
        <td>011</td>
        <td>017</td>
        <td>80</td>
        <td>FaleMais 60</td>
        <td>R$ 37,40</td>
        <td>R$ 136,00</td>
    </tr>
    <tr>
        <td>018</td>
        <td>011</td>
        <td>200</td>
        <td>FaleMais 120</td>
        <td>R$ 167,20</td>
        <td>R$ 380,00</td>
    </tr>   
</table>

# Build

APKs e um host web são disponibilizados, mas caso desseje buildar a aplicação localmente será necessário:

`Flutter 3.0.5`

E o comando:

`Flutter run`
