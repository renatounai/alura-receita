from django.shortcuts import render, get_object_or_404
from .models import Receita


# Create your views here.
def index(request):
    receitas = Receita.objects.order_by('-data_receita').filter(publicada=True)

    dados = {
        'receitas' : receitas
    }

    return render(request, 'index.html', dados)


def receita(request, receita_id):
    receita_a_exibir = {
        'receita': get_object_or_404(Receita, pk=receita_id)
    }

    print(receita_a_exibir)

    return render(request, 'receita.html', receita_a_exibir)
