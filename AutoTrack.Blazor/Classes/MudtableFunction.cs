using System.Reflection;

namespace AutoTrack.Blazor;

public class MudtableFunction<T>
{
    private int DetailIndex { get; set; } = -1;
    public int RowsPerPage { get; set; }
    public string Height { get; set; }
    public string SearchString { get; set; }
    public string Placeholder { get; set; }
    public T SelectedItem { get; set; }
    public Func<T, bool> Function { get; set; }
    public List<T> Data { get; set; }

    /// <summary>
    /// Properties cache info
    /// </summary>
    private readonly PropertyInfo[] _propertyCache;

    public MudtableFunction()
    {
        Data = [];
        Function = new Func<T, bool>(FilterFunc);
        RowsPerPage = 100;
        Height = "400px";
        SearchString = string.Empty;
        Placeholder = "Pesquisar";

        Type type = typeof(T);
        _propertyCache = type
            .GetProperties(BindingFlags.Instance | BindingFlags.Public);
    }

    public bool FilterFunc(T element) => FilterFunc(element, SearchString);

    public bool FilterFunc(T element, string searchString)
    {
        if (element == null)
            return false;

        if (string.IsNullOrWhiteSpace(searchString))
            return true; //precisa mostrar tudo

        if (_propertyCache == null || _propertyCache.Length == 0)
            return false;

        foreach (var pi in _propertyCache)
        {
            var value = pi.GetValue(element);
            if (value is null)
                continue;

            var str = value.ToString();
            if (string.IsNullOrEmpty(str))
                continue;

            if (str.Contains(searchString, StringComparison.OrdinalIgnoreCase))
                return true;
        }

        return false;
    }

    public void ShowBtnPress(T content)
    {
        int _index = Data.IndexOf(content);
        if (DetailIndex != _index)
        {
            DetailIndex = _index;
            return;
        }
            
        DetailIndex = -1;
    }

    public bool IsShowDetails(T content)
    {
        int _index = Data.IndexOf(content);
        if (DetailIndex != _index)
            return false;
        return true;
    }
}



/* =========== EXAMPLES =============

<MudTable FixedHeader="true"
            FixedFooter="true"
            Class="py-2"
            Items="@mudtable.Data"
            Filter="@mudtable.Function"
            Height="@mudtable.Height"
            RowsPerPage="@mudtable.RowsPerPage" @bind-SelectedItem="mudtable.SelectedItem">
    <ColGroup>
        <col />
        <col />
        <col style="width: 20%;" />
    </ColGroup>
    <ToolBarContent>
        <MudText Typo="Typo.h6">Veículos Cadastrados</MudText>
        <MudSpacer />
        <MudTextField @bind-Value="mudtable.SearchString"
            Placeholder="@mudtable.Placeholder"
            Adornment="Adornment.Start"
            AdornmentIcon="@Icons.Material.Filled.Search"
            IconSize="Size.Medium">
            </MudTextField>
    </ToolBarContent>
    <HeaderContent>
        <MudTh>Marca</MudTh>
        <MudTh>Veículo</MudTh>
        <MudTh>Ações</MudTh>
    </HeaderContent>
    <RowTemplate>
        <MudTd>@context.Brand</MudTd>
        <MudTd>@context.Vehicle</MudTd>
        <MudTd>
            <MudButton OnClick="@(() => Edit(context))" Variant="Variant.Outlined" Color="Color.Warning">Editar</MudButton>
            <MudButton OnClick="@(() => Delete(context))" Variant="Variant.Outlined" Color="Color.Error">Deletar</MudButton>
        </MudTd>
    </RowTemplate>
</MudTable>
*/