classdef SelenoidUpdated_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        SelenoidSimlasyonUIFigure  matlab.ui.Figure
        REditFieldLabel            matlab.ui.control.Label
        REditField                 matlab.ui.control.NumericEditField
        dEditFieldLabel            matlab.ui.control.Label
        dEditField                 matlab.ui.control.NumericEditField
        NEditFieldLabel            matlab.ui.control.Label
        NEditField                 matlab.ui.control.NumericEditField
        UIAxes                     matlab.ui.control.UIAxes
        SimulationButton           matlab.ui.control.Button
        LEditFieldLabel            matlab.ui.control.Label
        LEditField                 matlab.ui.control.NumericEditField
        YarapLabel                 matlab.ui.control.Label
        UzaklkLabel                matlab.ui.control.Label
        SarmSaysLabel              matlab.ui.control.Label
        UzunlukLabel               matlab.ui.control.Label
        MalzemeTrDropDownLabel     matlab.ui.control.Label
        MalzemeTrDropDown          matlab.ui.control.DropDown
    end

    methods (Access = private)

        % Button pushed function: SimulationButton
        function SimulationButtonPushed(app, event)
            I = 1;
            r = app.REditField.Value;
            d = app.dEditField.Value;
            z = [-d:.1:d];
            n = app.NEditField.Value;
            L = app.LEditField.Value;
            value = app.MalzemeTrDropDown.Value;
            if (strcmp(value,'Kobalt'))
                t = 600;
            elseif (strcmp(value,'Demir'))
                t = 9000;
            elseif (strcmp(value,'Nikel'))
                t = 250;
            elseif (strcmp(value,'Alüminyum'))
                t = 1.000021;
            elseif (strcmp(value,'Titanyum'))
                t = 1.00018;
            elseif (strcmp(value,'Altýn'))
                t = 0.99983;
            elseif (strcmp(value,'Gümüþ'))
                t = 0.99998;
            elseif (strcmp(value,'Bakýr'))
                t = 0.99999;
            end
            H =  (0.5*n*I/L).*[((z+L/2)./(sqrt((z+L/2).^2+r.^2)))-((z-L/2)./(sqrt((z-L/2).^2+r.^2)))];
            B = H .* t;
            plot(app.UIAxes,z,B);
        end
    end

    % App initialization and construction
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create SelenoidSimlasyonUIFigure
            app.SelenoidSimlasyonUIFigure = uifigure;
            app.SelenoidSimlasyonUIFigure.Position = [100 100 860 536];
            app.SelenoidSimlasyonUIFigure.Name = 'Selenoid Simülasyon';

            % Create REditFieldLabel
            app.REditFieldLabel = uilabel(app.SelenoidSimlasyonUIFigure);
            app.REditFieldLabel.HorizontalAlignment = 'right';
            app.REditFieldLabel.Position = [291 458 25 22];
            app.REditFieldLabel.Text = 'R';

            % Create REditField
            app.REditField = uieditfield(app.SelenoidSimlasyonUIFigure, 'numeric');
            app.REditField.Position = [331 458 100 22];

            % Create dEditFieldLabel
            app.dEditFieldLabel = uilabel(app.SelenoidSimlasyonUIFigure);
            app.dEditFieldLabel.HorizontalAlignment = 'right';
            app.dEditFieldLabel.Position = [291 422 25 22];
            app.dEditFieldLabel.Text = 'd';

            % Create dEditField
            app.dEditField = uieditfield(app.SelenoidSimlasyonUIFigure, 'numeric');
            app.dEditField.Position = [331 422 100 22];

            % Create NEditFieldLabel
            app.NEditFieldLabel = uilabel(app.SelenoidSimlasyonUIFigure);
            app.NEditFieldLabel.HorizontalAlignment = 'right';
            app.NEditFieldLabel.Position = [534 464 25 22];
            app.NEditFieldLabel.Text = 'N';

            % Create NEditField
            app.NEditField = uieditfield(app.SelenoidSimlasyonUIFigure, 'numeric');
            app.NEditField.Position = [574 464 100 22];

            % Create UIAxes
            app.UIAxes = uiaxes(app.SelenoidSimlasyonUIFigure);
            title(app.UIAxes, 'Manyetik Alan Deðiþimi')
            xlabel(app.UIAxes, 'Mesafe')
            ylabel(app.UIAxes, 'Manyetik Alan')
            app.UIAxes.Position = [99 21 679 301];

            % Create SimulationButton
            app.SimulationButton = uibutton(app.SelenoidSimlasyonUIFigure, 'push');
            app.SimulationButton.ButtonPushedFcn = createCallbackFcn(app, @SimulationButtonPushed, true);
            app.SimulationButton.Position = [389 342 100 22];
            app.SimulationButton.Text = 'Simulation';

            % Create LEditFieldLabel
            app.LEditFieldLabel = uilabel(app.SelenoidSimlasyonUIFigure);
            app.LEditFieldLabel.HorizontalAlignment = 'right';
            app.LEditFieldLabel.Position = [534 422 25 22];
            app.LEditFieldLabel.Text = 'L';

            % Create LEditField
            app.LEditField = uieditfield(app.SelenoidSimlasyonUIFigure, 'numeric');
            app.LEditField.Position = [574 422 100 22];

            % Create YarapLabel
            app.YarapLabel = uilabel(app.SelenoidSimlasyonUIFigure);
            app.YarapLabel.Position = [218 458 52 22];
            app.YarapLabel.Text = 'Yarý Çap';

            % Create UzaklkLabel
            app.UzaklkLabel = uilabel(app.SelenoidSimlasyonUIFigure);
            app.UzaklkLabel.Position = [218 422 45 22];
            app.UzaklkLabel.Text = 'Uzaklýk';

            % Create SarmSaysLabel
            app.SarmSaysLabel = uilabel(app.SelenoidSimlasyonUIFigure);
            app.SarmSaysLabel.Position = [461 464 74 22];
            app.SarmSaysLabel.Text = 'Sarým Sayýsý';

            % Create UzunlukLabel
            app.UzunlukLabel = uilabel(app.SelenoidSimlasyonUIFigure);
            app.UzunlukLabel.Position = [461 422 49 22];
            app.UzunlukLabel.Text = 'Uzunluk';

            % Create MalzemeTrDropDownLabel
            app.MalzemeTrDropDownLabel = uilabel(app.SelenoidSimlasyonUIFigure);
            app.MalzemeTrDropDownLabel.HorizontalAlignment = 'right';
            app.MalzemeTrDropDownLabel.Position = [342 382 82 22];
            app.MalzemeTrDropDownLabel.Text = 'Malzeme Türü';

            % Create MalzemeTrDropDown
            app.MalzemeTrDropDown = uidropdown(app.SelenoidSimlasyonUIFigure);
            app.MalzemeTrDropDown.Items = {'Kobalt', 'Demir', 'Nikel', 'Alüminyum', 'Titanyum', 'Altýn', 'Gümüþ', 'Bakýr'};
            app.MalzemeTrDropDown.Position = [435 382 100 22];
            app.MalzemeTrDropDown.Value = 'Kobalt';
        end
    end

    methods (Access = public)

        % Construct app
        function app = SelenoidUpdated_exported

            % Create and configure components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.SelenoidSimlasyonUIFigure)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.SelenoidSimlasyonUIFigure)
        end
    end
end